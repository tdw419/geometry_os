; DESCRIPTION: Draws a cyan rectangle at (16, 185) with width 41 and height 58.
; PLAN: r0=16(x), r1=185(y), r2=41(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 185
LDI r2, 41
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
