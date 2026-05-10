; DESCRIPTION: Composite: Places a red line segment connecting (242, 145) to (214, 172) then Renders a white disk with center (133, 181) and radius 61 then Places a purple dot at position (20, 121).
; PLAN: r0=242(x1), r1=145(y1), r2=214(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=133(x), r6=181(y), r7=61(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=20(x), r11=121(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 242
LDI r1, 145
LDI r2, 214
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 133
LDI r6, 181
LDI r7, 61
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 20
LDI r11, 121
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
