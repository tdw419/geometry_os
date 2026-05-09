; DESCRIPTION: Draws a green rectangle at (171, 1) with width 102 and height 49.
; PLAN: r0=171(x), r1=1(y), r2=102(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 1
LDI r2, 102
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
