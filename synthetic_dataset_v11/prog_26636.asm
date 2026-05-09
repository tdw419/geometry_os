; DESCRIPTION: Draws a green rectangle at (168, 148) with width 62 and height 106.
; PLAN: r0=168(x), r1=148(y), r2=62(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 148
LDI r2, 62
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
