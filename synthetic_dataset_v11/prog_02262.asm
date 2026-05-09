; DESCRIPTION: Draws a cyan rectangle at (105, 83) with width 102 and height 70.
; PLAN: r0=105(x), r1=83(y), r2=102(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 83
LDI r2, 102
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
