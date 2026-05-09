; DESCRIPTION: Composite: Sets a single black pixel at (308, 161) then Creates a blue circular shape at (463, 96) with radius 19 then Renders a white box of size 50x84 starting at (159, 132).
; PLAN: r0=308(x), r1=161(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=463(x), r6=96(y), r7=19(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=159(x), r11=132(y), r12=50(width), r13=84(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 161
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 463
LDI r6, 96
LDI r7, 19
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 159
LDI r11, 132
LDI r12, 50
LDI r13, 84
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
