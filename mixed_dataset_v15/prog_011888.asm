; DESCRIPTION: Draws a green rectangle at (188, 171) with width 68 and height 81.
; PLAN: r0=188(x), r1=171(y), r2=68(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 171
LDI r2, 68
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
