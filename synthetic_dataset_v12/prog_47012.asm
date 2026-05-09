; DESCRIPTION: Draws a blue rectangle at (46, 49) with width 91 and height 24.
; PLAN: r0=46(x), r1=49(y), r2=91(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 49
LDI r2, 91
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
