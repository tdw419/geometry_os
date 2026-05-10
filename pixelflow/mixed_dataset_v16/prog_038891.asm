; DESCRIPTION: Composite: Draws a purple circle centered at (98, 140) with radius 66 then Renders a blue box of size 13x30 starting at (368, 71).
; PLAN: r0=98(x), r1=140(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=368(x), r6=71(y), r7=13(width), r8=30(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 98
LDI r1, 140
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 368
LDI r6, 71
LDI r7, 13
LDI r8, 30
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
