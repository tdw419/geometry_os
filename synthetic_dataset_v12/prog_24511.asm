; DESCRIPTION: Draws a yellow rectangle at (32, 103) with width 24 and height 114.
; PLAN: r0=32(x), r1=103(y), r2=24(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 103
LDI r2, 24
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
