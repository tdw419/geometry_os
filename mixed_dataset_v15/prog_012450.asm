; DESCRIPTION: Composite: Renders a orange line between points (458, 187) and (359, 115) then Renders a cyan disk with center (381, 112) and radius 46.
; PLAN: r0=458(x1), r1=187(y1), r2=359(x2), r3=115(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=381(x), r6=112(y), r7=46(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 458
LDI r1, 187
LDI r2, 359
LDI r3, 115
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 381
LDI r6, 112
LDI r7, 46
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
