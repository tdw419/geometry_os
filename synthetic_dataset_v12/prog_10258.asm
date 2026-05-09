; DESCRIPTION: Draws a red rectangle at (406, 219) with width 63 and height 15.
; PLAN: r0=406(x), r1=219(y), r2=63(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 219
LDI r2, 63
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
