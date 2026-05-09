; DESCRIPTION: Composite: Renders a green disk with center (456, 198) and radius 35 then Places a yellow 105x96 rectangle at position (179, 67).
; PLAN: r0=456(x), r1=198(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=179(x), r6=67(y), r7=105(width), r8=96(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 456
LDI r1, 198
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 179
LDI r6, 67
LDI r7, 105
LDI r8, 96
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
