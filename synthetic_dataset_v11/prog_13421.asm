; DESCRIPTION: Draws a green rectangle at (71, 124) with width 26 and height 59.
; PLAN: r0=71(x), r1=124(y), r2=26(width), r3=59(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 124
LDI r2, 26
LDI r3, 59
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
