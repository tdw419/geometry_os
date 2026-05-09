; DESCRIPTION: Draws a orange rectangle at (329, 135) with width 98 and height 83.
; PLAN: r0=329(x), r1=135(y), r2=98(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 135
LDI r2, 98
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
