; DESCRIPTION: Composite: Places a magenta line segment connecting (436, 35) to (116, 105) then Renders a black disk with center (33, 63) and radius 23 then Sets a single purple pixel at (170, 28).
; PLAN: r0=436(x1), r1=35(y1), r2=116(x2), r3=105(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=33(x), r6=63(y), r7=23(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=170(x), r11=28(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 436
LDI r1, 35
LDI r2, 116
LDI r3, 105
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 33
LDI r6, 63
LDI r7, 23
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 170
LDI r11, 28
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
