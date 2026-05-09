; DESCRIPTION: Composite: Sets a single red pixel at (40, 222) then Renders a white line between points (504, 100) and (437, 132).
; PLAN: r0=40(x), r1=222(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=504(x1), r6=100(y1), r7=437(x2), r8=132(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 40
LDI r1, 222
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 504
LDI r6, 100
LDI r7, 437
LDI r8, 132
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
