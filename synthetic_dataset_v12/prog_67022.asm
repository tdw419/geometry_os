; DESCRIPTION: Draws a cyan rectangle at (386, 15) with width 41 and height 77.
; PLAN: r0=386(x), r1=15(y), r2=41(width), r3=77(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 15
LDI r2, 41
LDI r3, 77
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
