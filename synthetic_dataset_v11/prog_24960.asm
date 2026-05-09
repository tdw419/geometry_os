; DESCRIPTION: Draws a cyan rectangle at (80, 84) with width 57 and height 41.
; PLAN: r0=80(x), r1=84(y), r2=57(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 84
LDI r2, 57
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
