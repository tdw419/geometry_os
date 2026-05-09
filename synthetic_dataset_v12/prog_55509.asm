; DESCRIPTION: Draws a cyan rectangle at (46, 185) with width 13 and height 38.
; PLAN: r0=46(x), r1=185(y), r2=13(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 185
LDI r2, 13
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
