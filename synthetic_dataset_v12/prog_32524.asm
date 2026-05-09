; DESCRIPTION: Composite: Sets a single magenta pixel at (85, 49) then Renders a white disk with center (418, 119) and radius 79 then Renders a yellow box of size 10x97 starting at (434, 81).
; PLAN: r0=85(x), r1=49(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=418(x), r6=119(y), r7=79(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=434(x), r11=81(y), r12=10(width), r13=97(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 85
LDI r1, 49
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 418
LDI r6, 119
LDI r7, 79
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 434
LDI r11, 81
LDI r12, 10
LDI r13, 97
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
