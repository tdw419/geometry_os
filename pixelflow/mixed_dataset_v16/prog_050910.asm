; DESCRIPTION: Draws a green rectangle at (168, 18) with width 69 and height 109.
; PLAN: r0=168(x), r1=18(y), r2=69(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 18
LDI r2, 69
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
