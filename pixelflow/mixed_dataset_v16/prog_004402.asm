; DESCRIPTION: Composite: Renders a cyan line between points (349, 85) and (407, 64) then Draws a green circle centered at (219, 161) with radius 78 then Sets a single magenta pixel at (419, 33).
; PLAN: r0=349(x1), r1=85(y1), r2=407(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=219(x), r6=161(y), r7=78(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=419(x), r11=33(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 349
LDI r1, 85
LDI r2, 407
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 161
LDI r7, 78
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 419
LDI r11, 33
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
