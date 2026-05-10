; DESCRIPTION: Draws a red rectangle at (180, 83) with width 19 and height 30.
; PLAN: r0=180(x), r1=83(y), r2=19(width), r3=30(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 83
LDI r2, 19
LDI r3, 30
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
