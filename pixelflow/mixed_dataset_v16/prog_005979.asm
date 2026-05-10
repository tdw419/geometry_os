; DESCRIPTION: Composite: Renders a green disk with center (412, 178) and radius 76 then Renders a yellow box of size 88x44 starting at (249, 127).
; PLAN: r0=412(x), r1=178(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=249(x), r6=127(y), r7=88(width), r8=44(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 412
LDI r1, 178
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 249
LDI r6, 127
LDI r7, 88
LDI r8, 44
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
