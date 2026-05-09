; DESCRIPTION: Composite: . Then Places a purple line segment connecting (218, 159) to (122, 15). Then Draws a purple rectangle at (150, 74) with width 46 and height 109.
; PLAN: r0=218(x1), r1=159(y1), r2=122(x2), r3=15(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=150(x), r1=74(y), r2=46(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a purple line segment connecting (218, 159) to (122, 15).
; PLAN: r0=218(x1), r1=159(y1), r2=122(x2), r3=15(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 159
LDI r2, 122
LDI r3, 15
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple rectangle at (150, 74) with width 46 and height 109.
; PLAN: r0=150(x), r1=74(y), r2=46(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 74
LDI r2, 46
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
