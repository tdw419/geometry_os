; DESCRIPTION: Draws a green rectangle at (148, 140) with width 45 and height 99.
; PLAN: r0=148(x), r1=140(y), r2=45(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 140
LDI r2, 45
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
