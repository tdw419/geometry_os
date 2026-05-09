; DESCRIPTION: Draws a green rectangle at (33, 176) with width 93 and height 68.
; PLAN: r0=33(x), r1=176(y), r2=93(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 176
LDI r2, 93
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
