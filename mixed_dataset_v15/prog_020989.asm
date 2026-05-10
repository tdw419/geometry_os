; DESCRIPTION: Composite: Sets a single blue pixel at (342, 24) then Places a black circle of radius 68 at center (243, 130) then Renders a yellow box of size 30x114 starting at (133, 38).
; PLAN: r0=342(x), r1=24(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=243(x), r6=130(y), r7=68(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=133(x), r11=38(y), r12=30(width), r13=114(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 342
LDI r1, 24
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 243
LDI r6, 130
LDI r7, 68
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 133
LDI r11, 38
LDI r12, 30
LDI r13, 114
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
