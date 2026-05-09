; DESCRIPTION: Draws a cyan rectangle at (461, 70) with width 13 and height 29.
; PLAN: r0=461(x), r1=70(y), r2=13(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 70
LDI r2, 13
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
