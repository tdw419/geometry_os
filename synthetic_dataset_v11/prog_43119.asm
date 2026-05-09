; DESCRIPTION: Draws a green rectangle at (161, 102) with width 59 and height 115.
; PLAN: r0=161(x), r1=102(y), r2=59(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 102
LDI r2, 59
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
