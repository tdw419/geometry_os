; DESCRIPTION: Draws a red rectangle at (255, 55) with width 73 and height 97.
; PLAN: r0=255(x), r1=55(y), r2=73(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 55
LDI r2, 73
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
