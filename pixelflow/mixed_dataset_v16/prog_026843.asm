; DESCRIPTION: Draws a cyan rectangle at (116, 188) with width 102 and height 24.
; PLAN: r0=116(x), r1=188(y), r2=102(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 188
LDI r2, 102
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
