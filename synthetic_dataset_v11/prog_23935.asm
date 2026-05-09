; DESCRIPTION: Draws a yellow rectangle at (217, 53) with width 37 and height 83.
; PLAN: r0=217(x), r1=53(y), r2=37(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 53
LDI r2, 37
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
