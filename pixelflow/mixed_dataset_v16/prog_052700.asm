; DESCRIPTION: Composite: Places a blue circle of radius 71 at center (88, 147) then Renders a yellow box of size 62x96 starting at (396, 157).
; PLAN: r0=88(x), r1=147(y), r2=71(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=396(x), r6=157(y), r7=62(width), r8=96(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 88
LDI r1, 147
LDI r2, 71
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 396
LDI r6, 157
LDI r7, 62
LDI r8, 96
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
