; DESCRIPTION: Draws a green rectangle at (142, 103) with width 49 and height 102.
; PLAN: r0=142(x), r1=103(y), r2=49(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 103
LDI r2, 49
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
