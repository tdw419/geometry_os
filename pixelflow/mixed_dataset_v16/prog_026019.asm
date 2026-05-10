; DESCRIPTION: Draws a blue rectangle at (303, 150) with width 80 and height 106.
; PLAN: r0=303(x), r1=150(y), r2=80(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 150
LDI r2, 80
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
