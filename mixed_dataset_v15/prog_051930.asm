; DESCRIPTION: Draws a cyan rectangle at (292, 159) with width 85 and height 58.
; PLAN: r0=292(x), r1=159(y), r2=85(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 159
LDI r2, 85
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
