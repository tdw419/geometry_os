; DESCRIPTION: Draws a black rectangle at (173, 77) with width 10 and height 63.
; PLAN: r0=173(x), r1=77(y), r2=10(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 77
LDI r2, 10
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
