; DESCRIPTION: Draws a cyan rectangle at (22, 13) with width 70 and height 87.
; PLAN: r0=22(x), r1=13(y), r2=70(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 13
LDI r2, 70
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
