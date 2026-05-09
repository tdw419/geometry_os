; DESCRIPTION: Draws a green rectangle at (212, 93) with width 33 and height 22.
; PLAN: r0=212(x), r1=93(y), r2=33(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 93
LDI r2, 33
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
