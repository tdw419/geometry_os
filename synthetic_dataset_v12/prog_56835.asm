; DESCRIPTION: Draws a yellow rectangle at (320, 95) with width 32 and height 116.
; PLAN: r0=320(x), r1=95(y), r2=32(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 95
LDI r2, 32
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
