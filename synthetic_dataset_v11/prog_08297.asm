; DESCRIPTION: Draws a cyan rectangle at (127, 135) with width 105 and height 41.
; PLAN: r0=127(x), r1=135(y), r2=105(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 135
LDI r2, 105
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
