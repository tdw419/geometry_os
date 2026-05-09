; DESCRIPTION: Draws a yellow rectangle at (183, 85) with width 23 and height 111.
; PLAN: r0=183(x), r1=85(y), r2=23(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 85
LDI r2, 23
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
