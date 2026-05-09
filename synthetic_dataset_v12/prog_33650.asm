; DESCRIPTION: Draws a orange rectangle at (63, 208) with width 48 and height 39.
; PLAN: r0=63(x), r1=208(y), r2=48(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 208
LDI r2, 48
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
