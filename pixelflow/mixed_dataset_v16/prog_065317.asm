; DESCRIPTION: Draws a orange rectangle at (33, 64) with width 90 and height 19.
; PLAN: r0=33(x), r1=64(y), r2=90(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 64
LDI r2, 90
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
