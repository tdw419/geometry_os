; DESCRIPTION: Draws a yellow rectangle at (63, 154) with width 18 and height 86.
; PLAN: r0=63(x), r1=154(y), r2=18(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 154
LDI r2, 18
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
