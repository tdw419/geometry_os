; DESCRIPTION: Draws a black rectangle at (220, 181) with width 32 and height 22.
; PLAN: r0=220(x), r1=181(y), r2=32(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 181
LDI r2, 32
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
