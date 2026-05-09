; DESCRIPTION: Draws a orange rectangle at (356, 132) with width 93 and height 84.
; PLAN: r0=356(x), r1=132(y), r2=93(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 132
LDI r2, 93
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
