; DESCRIPTION: Draws a cyan rectangle at (68, 43) with width 79 and height 58.
; PLAN: r0=68(x), r1=43(y), r2=79(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 43
LDI r2, 79
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
