; DESCRIPTION: Draws a blue rectangle at (44, 115) with width 50 and height 91.
; PLAN: r0=44(x), r1=115(y), r2=50(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 115
LDI r2, 50
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
