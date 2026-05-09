; DESCRIPTION: Draws a black rectangle at (63, 25) with width 111 and height 85.
; PLAN: r0=63(x), r1=25(y), r2=111(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 25
LDI r2, 111
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
