; DESCRIPTION: Draws a black rectangle at (172, 100) with width 79 and height 103.
; PLAN: r0=172(x), r1=100(y), r2=79(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 100
LDI r2, 79
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
