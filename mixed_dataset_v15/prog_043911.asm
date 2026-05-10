; DESCRIPTION: Draws a yellow rectangle at (87, 31) with width 34 and height 63.
; PLAN: r0=87(x), r1=31(y), r2=34(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 31
LDI r2, 34
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
