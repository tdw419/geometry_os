; DESCRIPTION: Draws a green rectangle at (374, 148) with width 78 and height 70.
; PLAN: r0=374(x), r1=148(y), r2=78(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 148
LDI r2, 78
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
