; DESCRIPTION: Composite: Draws a black circle centered at (365, 112) with radius 55 then Renders a blue box of size 10x38 starting at (476, 24).
; PLAN: r0=365(x), r1=112(y), r2=55(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=476(x), r6=24(y), r7=10(width), r8=38(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 365
LDI r1, 112
LDI r2, 55
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 476
LDI r6, 24
LDI r7, 10
LDI r8, 38
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
