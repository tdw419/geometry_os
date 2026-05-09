; DESCRIPTION: Draws a yellow rectangle at (282, 133) with width 95 and height 32.
; PLAN: r0=282(x), r1=133(y), r2=95(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 133
LDI r2, 95
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
