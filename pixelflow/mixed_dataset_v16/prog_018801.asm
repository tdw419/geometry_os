; DESCRIPTION: Draws a cyan rectangle at (49, 102) with width 22 and height 82.
; PLAN: r0=49(x), r1=102(y), r2=22(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 102
LDI r2, 22
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
