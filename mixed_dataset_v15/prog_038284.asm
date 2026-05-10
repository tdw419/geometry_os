; DESCRIPTION: Draws a yellow rectangle at (415, 52) with width 47 and height 99.
; PLAN: r0=415(x), r1=52(y), r2=47(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 52
LDI r2, 47
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
