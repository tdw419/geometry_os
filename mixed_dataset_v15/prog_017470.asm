; DESCRIPTION: Draws a cyan rectangle at (246, 158) with width 112 and height 14.
; PLAN: r0=246(x), r1=158(y), r2=112(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 158
LDI r2, 112
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
