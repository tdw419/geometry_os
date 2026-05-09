; DESCRIPTION: Draws a white rectangle at (225, 138) with width 22 and height 59.
; PLAN: r0=225(x), r1=138(y), r2=22(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 138
LDI r2, 22
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
