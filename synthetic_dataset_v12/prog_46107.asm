; DESCRIPTION: Draws a green rectangle at (255, 79) with width 63 and height 116.
; PLAN: r0=255(x), r1=79(y), r2=63(width), r3=116(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 79
LDI r2, 63
LDI r3, 116
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
