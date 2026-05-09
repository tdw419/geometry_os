; DESCRIPTION: Draws a green rectangle at (350, 178) with width 88 and height 71.
; PLAN: r0=350(x), r1=178(y), r2=88(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 178
LDI r2, 88
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
