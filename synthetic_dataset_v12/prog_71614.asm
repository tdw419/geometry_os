; DESCRIPTION: Draws a green rectangle at (415, 73) with width 30 and height 114.
; PLAN: r0=415(x), r1=73(y), r2=30(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 73
LDI r2, 30
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
