; DESCRIPTION: Draws a yellow rectangle at (346, 91) with width 69 and height 53.
; PLAN: r0=346(x), r1=91(y), r2=69(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 91
LDI r2, 69
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
