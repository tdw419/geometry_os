; DESCRIPTION: Draws a orange rectangle at (330, 8) with width 115 and height 108.
; PLAN: r0=330(x), r1=8(y), r2=115(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 8
LDI r2, 115
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
