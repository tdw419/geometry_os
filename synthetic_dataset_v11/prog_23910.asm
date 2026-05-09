; DESCRIPTION: Draws a cyan rectangle at (76, 70) with width 102 and height 108.
; PLAN: r0=76(x), r1=70(y), r2=102(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 70
LDI r2, 102
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
