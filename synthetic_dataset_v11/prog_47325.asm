; DESCRIPTION: Draws a cyan rectangle at (80, 58) with width 10 and height 41.
; PLAN: r0=80(x), r1=58(y), r2=10(width), r3=41(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 58
LDI r2, 10
LDI r3, 41
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
