; DESCRIPTION: Composite: Renders a blue box of size 44x63 starting at (352, 167) then Creates a purple circular shape at (329, 117) with radius 21.
; PLAN: r0=352(x), r1=167(y), r2=44(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=329(x), r6=117(y), r7=21(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 352
LDI r1, 167
LDI r2, 44
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 117
LDI r7, 21
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
