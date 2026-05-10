; DESCRIPTION: Draws a cyan rectangle at (292, 95) with width 78 and height 101.
; PLAN: r0=292(x), r1=95(y), r2=78(width), r3=101(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 95
LDI r2, 78
LDI r3, 101
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
