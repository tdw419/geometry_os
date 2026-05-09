; DESCRIPTION: Draws a green rectangle at (469, 70) with width 20 and height 98.
; PLAN: r0=469(x), r1=70(y), r2=20(width), r3=98(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 70
LDI r2, 20
LDI r3, 98
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
