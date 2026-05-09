; DESCRIPTION: Draws a cyan rectangle at (216, 54) with width 70 and height 100.
; PLAN: r0=216(x), r1=54(y), r2=70(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 54
LDI r2, 70
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
