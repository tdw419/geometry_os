; DESCRIPTION: Composite: . Then Draws a purple rectangle at (58, 97) with width 23 and height 73. Then Draws a cyan line from (81, 203) to (85, 214).
; PLAN: r0=58(x), r1=97(y), r2=23(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=81(x1), r1=203(y1), r2=85(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple rectangle at (58, 97) with width 23 and height 73.
; PLAN: r0=58(x), r1=97(y), r2=23(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 97
LDI r2, 23
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan line from (81, 203) to (85, 214).
; PLAN: r0=81(x1), r1=203(y1), r2=85(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 203
LDI r2, 85
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
