; DESCRIPTION: Draws a white rectangle at (4, 23) with width 108 and height 68.
; PLAN: r0=4(x), r1=23(y), r2=108(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 23
LDI r2, 108
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
