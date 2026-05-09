; DESCRIPTION: Draws a black rectangle at (25, 45) with width 87 and height 113.
; PLAN: r0=25(x), r1=45(y), r2=87(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 45
LDI r2, 87
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
