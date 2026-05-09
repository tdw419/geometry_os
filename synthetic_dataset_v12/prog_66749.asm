; DESCRIPTION: Draws a blue rectangle at (130, 90) with width 76 and height 85.
; PLAN: r0=130(x), r1=90(y), r2=76(width), r3=85(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 90
LDI r2, 76
LDI r3, 85
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
