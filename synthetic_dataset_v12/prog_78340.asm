; DESCRIPTION: Draws a yellow rectangle at (418, 8) with width 78 and height 63.
; PLAN: r0=418(x), r1=8(y), r2=78(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 8
LDI r2, 78
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
