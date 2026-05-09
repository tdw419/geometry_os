; DESCRIPTION: Draws a orange rectangle at (178, 63) with width 73 and height 28.
; PLAN: r0=178(x), r1=63(y), r2=73(width), r3=28(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 63
LDI r2, 73
LDI r3, 28
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
