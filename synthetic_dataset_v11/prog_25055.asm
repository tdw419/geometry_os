; DESCRIPTION: Draws a cyan rectangle at (207, 151) with width 41 and height 58.
; PLAN: r0=207(x), r1=151(y), r2=41(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 151
LDI r2, 41
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
