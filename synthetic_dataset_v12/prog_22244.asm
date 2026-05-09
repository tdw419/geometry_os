; DESCRIPTION: Draws a cyan rectangle at (263, 79) with width 15 and height 41.
; PLAN: r0=263(x), r1=79(y), r2=15(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 79
LDI r2, 15
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
