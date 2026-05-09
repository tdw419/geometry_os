; DESCRIPTION: Draws a yellow rectangle at (19, 152) with width 13 and height 63.
; PLAN: r0=19(x), r1=152(y), r2=13(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 152
LDI r2, 13
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
