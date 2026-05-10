; DESCRIPTION: Draws a green rectangle at (352, 34) with width 59 and height 74.
; PLAN: r0=352(x), r1=34(y), r2=59(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 34
LDI r2, 59
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
