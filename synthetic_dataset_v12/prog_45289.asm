; DESCRIPTION: Draws a blue rectangle at (189, 116) with width 10 and height 70.
; PLAN: r0=189(x), r1=116(y), r2=10(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 116
LDI r2, 10
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
