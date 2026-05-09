; DESCRIPTION: Composite: Renders a black box of size 55x50 starting at (296, 104) then Renders a purple disk with center (291, 97) and radius 80.
; PLAN: r0=296(x), r1=104(y), r2=55(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=291(x), r6=97(y), r7=80(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 296
LDI r1, 104
LDI r2, 55
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 97
LDI r7, 80
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
