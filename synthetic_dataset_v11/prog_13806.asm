; DESCRIPTION: Draws a cyan rectangle at (49, 134) with width 15 and height 98.
; PLAN: r0=49(x), r1=134(y), r2=15(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 134
LDI r2, 15
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
