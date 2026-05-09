; DESCRIPTION: Draws a cyan rectangle at (191, 69) with width 75 and height 89.
; PLAN: r0=191(x), r1=69(y), r2=75(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 69
LDI r2, 75
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
