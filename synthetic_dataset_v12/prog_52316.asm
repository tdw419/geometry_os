; DESCRIPTION: Draws a yellow rectangle at (63, 208) with width 86 and height 26.
; PLAN: r0=63(x), r1=208(y), r2=86(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 208
LDI r2, 86
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
