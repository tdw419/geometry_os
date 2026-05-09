; DESCRIPTION: Composite: Places a green circle of radius 43 at center (133, 212) then Draws a purple rectangle at (267, 130) with width 43 and height 62.
; PLAN: r0=133(x), r1=212(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=267(x), r6=130(y), r7=43(width), r8=62(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 133
LDI r1, 212
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 267
LDI r6, 130
LDI r7, 43
LDI r8, 62
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
