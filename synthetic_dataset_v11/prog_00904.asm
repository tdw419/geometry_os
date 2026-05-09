; DESCRIPTION: Draws a green rectangle at (71, 148) with width 46 and height 70.
; PLAN: r0=71(x), r1=148(y), r2=46(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 148
LDI r2, 46
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
