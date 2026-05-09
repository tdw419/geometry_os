; DESCRIPTION: Draws a green rectangle at (303, 115) with width 33 and height 115.
; PLAN: r0=303(x), r1=115(y), r2=33(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 115
LDI r2, 33
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
