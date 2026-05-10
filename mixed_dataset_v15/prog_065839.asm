; DESCRIPTION: Draws a yellow rectangle at (275, 151) with width 14 and height 63.
; PLAN: r0=275(x), r1=151(y), r2=14(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 151
LDI r2, 14
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
