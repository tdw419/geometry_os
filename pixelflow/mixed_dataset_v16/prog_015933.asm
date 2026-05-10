; DESCRIPTION: Draws a blue rectangle at (292, 50) with width 36 and height 46.
; PLAN: r0=292(x), r1=50(y), r2=36(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 50
LDI r2, 36
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
