; DESCRIPTION: Draws a orange rectangle at (180, 74) with width 13 and height 95.
; PLAN: r0=180(x), r1=74(y), r2=13(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 74
LDI r2, 13
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
