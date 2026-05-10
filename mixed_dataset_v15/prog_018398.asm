; DESCRIPTION: Draws a yellow rectangle at (156, 121) with width 24 and height 63.
; PLAN: r0=156(x), r1=121(y), r2=24(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 121
LDI r2, 24
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
