; DESCRIPTION: Draws a black rectangle at (145, 141) with width 103 and height 32.
; PLAN: r0=145(x), r1=141(y), r2=103(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 141
LDI r2, 103
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
