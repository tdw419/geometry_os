; DESCRIPTION: Draws a green rectangle at (35, 180) with width 116 and height 59.
; PLAN: r0=35(x), r1=180(y), r2=116(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 180
LDI r2, 116
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
