; DESCRIPTION: Draws a yellow rectangle at (251, 171) with width 37 and height 63.
; PLAN: r0=251(x), r1=171(y), r2=37(width), r3=63(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 171
LDI r2, 37
LDI r3, 63
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
