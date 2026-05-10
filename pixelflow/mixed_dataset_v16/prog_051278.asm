; DESCRIPTION: Draws a green rectangle at (345, 13) with width 103 and height 35.
; PLAN: r0=345(x), r1=13(y), r2=103(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 13
LDI r2, 103
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
