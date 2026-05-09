; DESCRIPTION: Draws a black rectangle at (396, 74) with width 60 and height 102.
; PLAN: r0=396(x), r1=74(y), r2=60(width), r3=102(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 74
LDI r2, 60
LDI r3, 102
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
