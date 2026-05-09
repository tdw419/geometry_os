; DESCRIPTION: Draws a checkerboard pattern of 8x8 squares using black and white.
; PLAN: r0=167(x), r1=123(y), r2=18(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 15
LDI r2, 166
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT