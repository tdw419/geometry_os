; DESCRIPTION: Draws a cyan rectangle at (360, 70) with width 66 and height 68.
; PLAN: r0=360(x), r1=70(y), r2=66(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 70
LDI r2, 66
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
