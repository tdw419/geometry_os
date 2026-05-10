; DESCRIPTION: Draws a black rectangle at (50, 140) with width 73 and height 103.
; PLAN: r0=50(x), r1=140(y), r2=73(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 140
LDI r2, 73
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
