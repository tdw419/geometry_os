; DESCRIPTION: Draws a cyan rectangle at (372, 85) with width 41 and height 110.
; PLAN: r0=372(x), r1=85(y), r2=41(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 85
LDI r2, 41
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
