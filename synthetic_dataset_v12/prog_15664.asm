; DESCRIPTION: Draws a black rectangle at (369, 50) with width 116 and height 79.
; PLAN: r0=369(x), r1=50(y), r2=116(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 50
LDI r2, 116
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
