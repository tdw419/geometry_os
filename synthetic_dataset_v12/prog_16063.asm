; DESCRIPTION: Composite: Places a purple dot at position (5, 143) then Renders a red line between points (100, 3) and (218, 1).
; PLAN: r0=5(x), r1=143(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=100(x1), r6=3(y1), r7=218(x2), r8=1(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 5
LDI r1, 143
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 100
LDI r6, 3
LDI r7, 218
LDI r8, 1
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
