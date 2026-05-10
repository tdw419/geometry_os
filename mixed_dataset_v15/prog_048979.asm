; DESCRIPTION: Draws a cyan rectangle at (60, 36) with width 105 and height 66.
; PLAN: r0=60(x), r1=36(y), r2=105(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 36
LDI r2, 105
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
