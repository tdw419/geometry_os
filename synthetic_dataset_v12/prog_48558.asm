; DESCRIPTION: Draws a orange rectangle at (133, 19) with width 14 and height 64.
; PLAN: r0=133(x), r1=19(y), r2=14(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 19
LDI r2, 14
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
