; DESCRIPTION: Draws a black rectangle at (320, 147) with width 79 and height 84.
; PLAN: r0=320(x), r1=147(y), r2=79(width), r3=84(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 147
LDI r2, 79
LDI r3, 84
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
