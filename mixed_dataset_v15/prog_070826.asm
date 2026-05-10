; DESCRIPTION: Composite: Renders a yellow box of size 57x96 starting at (360, 48) then Places a magenta dot at position (488, 130) then Places a purple circle of radius 56 at center (423, 94).
; PLAN: r0=360(x), r1=48(y), r2=57(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=488(x), r6=130(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=423(x), r11=94(y), r12=56(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 360
LDI r1, 48
LDI r2, 57
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 488
LDI r6, 130
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 423
LDI r11, 94
LDI r12, 56
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
