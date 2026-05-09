; DESCRIPTION: Draws a black rectangle at (96, 13) with width 96 and height 103.
; PLAN: r0=96(x), r1=13(y), r2=96(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 13
LDI r2, 96
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
