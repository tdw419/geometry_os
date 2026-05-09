; DESCRIPTION: Draws a green rectangle at (108, 91) with width 25 and height 61.
; PLAN: r0=108(x), r1=91(y), r2=25(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 91
LDI r2, 25
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
