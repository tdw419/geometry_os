; DESCRIPTION: Draws a blue rectangle at (466, 180) with width 25 and height 50.
; PLAN: r0=466(x), r1=180(y), r2=25(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 180
LDI r2, 25
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
