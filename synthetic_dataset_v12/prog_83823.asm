; DESCRIPTION: Draws a black rectangle at (157, 226) with width 104 and height 16.
; PLAN: r0=157(x), r1=226(y), r2=104(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 226
LDI r2, 104
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
