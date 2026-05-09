; DESCRIPTION: Draws a green rectangle at (33, 73) with width 79 and height 72.
; PLAN: r0=33(x), r1=73(y), r2=79(width), r3=72(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 73
LDI r2, 79
LDI r3, 72
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
