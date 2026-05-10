; DESCRIPTION: Composite: Creates a yellow circular shape at (395, 189) with radius 48 then Renders a yellow box of size 19x70 starting at (132, 1) then Sets a single blue pixel at (169, 132).
; PLAN: r0=395(x), r1=189(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x), r6=1(y), r7=19(width), r8=70(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=169(x), r11=132(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 395
LDI r1, 189
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 1
LDI r7, 19
LDI r8, 70
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 169
LDI r11, 132
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
