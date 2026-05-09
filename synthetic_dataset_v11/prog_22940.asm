; DESCRIPTION: Draws a yellow rectangle at (103, 53) with width 68 and height 63.
; PLAN: r0=103(x), r1=53(y), r2=68(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 53
LDI r2, 68
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
