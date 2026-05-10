; DESCRIPTION: Draws a green rectangle at (335, 124) with width 108 and height 13.
; PLAN: r0=335(x), r1=124(y), r2=108(width), r3=13(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 124
LDI r2, 108
LDI r3, 13
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
