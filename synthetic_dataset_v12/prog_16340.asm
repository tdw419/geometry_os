; DESCRIPTION: Composite: Places a purple 41x88 rectangle at position (460, 87) then Draws a cyan circle centered at (306, 208) with radius 45.
; PLAN: r0=460(x), r1=87(y), r2=41(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=306(x), r6=208(y), r7=45(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 460
LDI r1, 87
LDI r2, 41
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 208
LDI r7, 45
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
