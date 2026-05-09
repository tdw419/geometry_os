; DESCRIPTION: Draws a cyan rectangle at (281, 123) with width 108 and height 69.
; PLAN: r0=281(x), r1=123(y), r2=108(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 123
LDI r2, 108
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
