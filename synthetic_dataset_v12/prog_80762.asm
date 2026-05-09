; DESCRIPTION: Draws a green rectangle at (225, 33) with width 87 and height 40.
; PLAN: r0=225(x), r1=33(y), r2=87(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 33
LDI r2, 87
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
