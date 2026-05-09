; DESCRIPTION: Draws a blue rectangle at (168, 91) with width 78 and height 102.
; PLAN: r0=168(x), r1=91(y), r2=78(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 91
LDI r2, 78
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
