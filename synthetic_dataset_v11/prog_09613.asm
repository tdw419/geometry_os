; DESCRIPTION: Draws a blue rectangle at (61, 109) with width 116 and height 65.
; PLAN: r0=61(x), r1=109(y), r2=116(width), r3=65(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 109
LDI r2, 116
LDI r3, 65
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
