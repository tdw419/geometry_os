; DESCRIPTION: Composite: Renders a green box of size 88x95 starting at (404, 48) then Draws a purple circle centered at (316, 166) with radius 66.
; PLAN: r0=404(x), r1=48(y), r2=88(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=316(x), r6=166(y), r7=66(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 404
LDI r1, 48
LDI r2, 88
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 166
LDI r7, 66
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
