; DESCRIPTION: Draws a green rectangle at (143, 180) with width 87 and height 74.
; PLAN: r0=143(x), r1=180(y), r2=87(width), r3=74(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 180
LDI r2, 87
LDI r3, 74
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
