; DESCRIPTION: Draws a black rectangle at (307, 157) with width 94 and height 26.
; PLAN: r0=307(x), r1=157(y), r2=94(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 157
LDI r2, 94
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
