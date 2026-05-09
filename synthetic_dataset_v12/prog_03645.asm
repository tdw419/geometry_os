; DESCRIPTION: Draws a green rectangle at (357, 150) with width 71 and height 40.
; PLAN: r0=357(x), r1=150(y), r2=71(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 150
LDI r2, 71
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
