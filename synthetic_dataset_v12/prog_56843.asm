; DESCRIPTION: Draws a green rectangle at (148, 60) with width 65 and height 87.
; PLAN: r0=148(x), r1=60(y), r2=65(width), r3=87(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 60
LDI r2, 65
LDI r3, 87
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
