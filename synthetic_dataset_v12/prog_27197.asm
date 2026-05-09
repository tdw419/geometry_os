; DESCRIPTION: Draws a green rectangle at (353, 124) with width 58 and height 90.
; PLAN: r0=353(x), r1=124(y), r2=58(width), r3=90(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 124
LDI r2, 58
LDI r3, 90
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
