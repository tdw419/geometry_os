; DESCRIPTION: Draws a cyan rectangle at (349, 156) with width 15 and height 71.
; PLAN: r0=349(x), r1=156(y), r2=15(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 156
LDI r2, 15
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
