; DESCRIPTION: Draws a black rectangle at (123, 8) with width 66 and height 21.
; PLAN: r0=123(x), r1=8(y), r2=66(width), r3=21(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 8
LDI r2, 66
LDI r3, 21
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
