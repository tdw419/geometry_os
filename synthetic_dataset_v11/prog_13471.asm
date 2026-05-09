; DESCRIPTION: Draws a green rectangle at (168, 188) with width 85 and height 26.
; PLAN: r0=168(x), r1=188(y), r2=85(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 188
LDI r2, 85
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
