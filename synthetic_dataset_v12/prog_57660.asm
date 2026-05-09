; DESCRIPTION: Draws a green rectangle at (54, 44) with width 92 and height 18.
; PLAN: r0=54(x), r1=44(y), r2=92(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 44
LDI r2, 92
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
