; DESCRIPTION: Draws a cyan rectangle at (195, 175) with width 46 and height 69.
; PLAN: r0=195(x), r1=175(y), r2=46(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 175
LDI r2, 46
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
