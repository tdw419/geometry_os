; DESCRIPTION: Draws a cyan rectangle at (63, 41) with width 116 and height 54.
; PLAN: r0=63(x), r1=41(y), r2=116(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 41
LDI r2, 116
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
