; DESCRIPTION: Draws a green rectangle at (129, 117) with width 93 and height 60.
; PLAN: r0=129(x), r1=117(y), r2=93(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 117
LDI r2, 93
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
