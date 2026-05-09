; DESCRIPTION: Draws a blue rectangle at (146, 106) with width 52 and height 44.
; PLAN: r0=146(x), r1=106(y), r2=52(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 106
LDI r2, 52
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
