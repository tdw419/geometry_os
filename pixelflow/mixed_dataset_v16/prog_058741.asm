; DESCRIPTION: Composite: Renders a orange line between points (187, 102) and (90, 200) then Renders a yellow disk with center (395, 147) and radius 78 then Sets a single magenta pixel at (397, 35).
; PLAN: r0=187(x1), r1=102(y1), r2=90(x2), r3=200(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=147(y), r7=78(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=397(x), r11=35(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 187
LDI r1, 102
LDI r2, 90
LDI r3, 200
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 147
LDI r7, 78
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 397
LDI r11, 35
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
