; DESCRIPTION: Draws a cyan rectangle at (349, 118) with width 116 and height 102.
; PLAN: r0=349(x), r1=118(y), r2=116(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 118
LDI r2, 116
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
