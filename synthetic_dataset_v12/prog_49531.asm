; DESCRIPTION: Draws a green rectangle at (415, 33) with width 14 and height 84.
; PLAN: r0=415(x), r1=33(y), r2=14(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 33
LDI r2, 14
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
