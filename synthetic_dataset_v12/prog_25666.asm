; DESCRIPTION: Draws a red rectangle at (132, 68) with width 55 and height 79.
; PLAN: r0=132(x), r1=68(y), r2=55(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 68
LDI r2, 55
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
