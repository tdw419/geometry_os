; DESCRIPTION: Composite: Places a orange 81x81 rectangle at position (79, 135) then Places a black circle of radius 43 at center (122, 184).
; PLAN: r0=79(x), r1=135(y), r2=81(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=122(x), r6=184(y), r7=43(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 79
LDI r1, 135
LDI r2, 81
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 184
LDI r7, 43
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
