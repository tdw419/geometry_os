; DESCRIPTION: Composite: Places a red dot at position (412, 60) then Renders a yellow line between points (463, 77) and (486, 99).
; PLAN: r0=412(x), r1=60(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=463(x1), r6=77(y1), r7=486(x2), r8=99(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 412
LDI r1, 60
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 463
LDI r6, 77
LDI r7, 486
LDI r8, 99
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
