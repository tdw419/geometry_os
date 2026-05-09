; DESCRIPTION: Draws a yellow rectangle at (128, 50) with width 66 and height 116.
; PLAN: r0=128(x), r1=50(y), r2=66(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 50
LDI r2, 66
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
