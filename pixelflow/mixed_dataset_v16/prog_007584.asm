; DESCRIPTION: Composite: Places a orange line segment connecting (35, 78) to (511, 97) then Draws a cyan circle centered at (223, 130) with radius 28 then Sets a single purple pixel at (19, 135).
; PLAN: r0=35(x1), r1=78(y1), r2=511(x2), r3=97(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=223(x), r6=130(y), r7=28(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=19(x), r11=135(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 35
LDI r1, 78
LDI r2, 511
LDI r3, 97
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 223
LDI r6, 130
LDI r7, 28
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 19
LDI r11, 135
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
