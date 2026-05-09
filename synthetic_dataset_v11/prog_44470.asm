; DESCRIPTION: Composite: . Then Draws a black rectangle at (65, 85) with width 61 and height 31. Then Places a purple line segment connecting (19, 151) to (47, 71).
; PLAN: r0=65(x), r1=85(y), r2=61(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=19(x1), r1=151(y1), r2=47(x2), r3=71(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black rectangle at (65, 85) with width 61 and height 31.
; PLAN: r0=65(x), r1=85(y), r2=61(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 85
LDI r2, 61
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple line segment connecting (19, 151) to (47, 71).
; PLAN: r0=19(x1), r1=151(y1), r2=47(x2), r3=71(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 151
LDI r2, 47
LDI r3, 71
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
