; DESCRIPTION: Draws a yellow rectangle at (126, 30) with width 37 and height 63.
; PLAN: r0=126(x), r1=30(y), r2=37(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 30
LDI r2, 37
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
