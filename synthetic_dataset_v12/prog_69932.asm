; DESCRIPTION: Draws a blue rectangle at (445, 181) with width 65 and height 75.
; PLAN: r0=445(x), r1=181(y), r2=65(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 181
LDI r2, 65
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
