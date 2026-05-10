; DESCRIPTION: Draws a orange rectangle at (151, 180) with width 119 and height 14.
; PLAN: r0=151(x), r1=180(y), r2=119(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 180
LDI r2, 119
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
