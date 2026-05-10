; DESCRIPTION: Draws a cyan rectangle at (113, 90) with width 41 and height 79.
; PLAN: r0=113(x), r1=90(y), r2=41(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 90
LDI r2, 41
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
