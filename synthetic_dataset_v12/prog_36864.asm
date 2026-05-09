; DESCRIPTION: Draws a yellow rectangle at (191, 29) with width 64 and height 103.
; PLAN: r0=191(x), r1=29(y), r2=64(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 29
LDI r2, 64
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
