; DESCRIPTION: Composite: Renders a cyan disk with center (395, 85) and radius 77 then Renders a cyan line between points (104, 51) and (307, 123).
; PLAN: r0=395(x), r1=85(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=104(x1), r6=51(y1), r7=307(x2), r8=123(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 395
LDI r1, 85
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 104
LDI r6, 51
LDI r7, 307
LDI r8, 123
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
