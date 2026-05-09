; DESCRIPTION: Draws a cyan rectangle at (161, 77) with width 85 and height 67.
; PLAN: r0=161(x), r1=77(y), r2=85(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 77
LDI r2, 85
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
