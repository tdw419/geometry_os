; DESCRIPTION: Draws a cyan rectangle at (18, 66) with width 15 and height 82.
; PLAN: r0=18(x), r1=66(y), r2=15(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 66
LDI r2, 15
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
