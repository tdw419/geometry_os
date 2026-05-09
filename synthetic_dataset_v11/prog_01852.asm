; DESCRIPTION: Composite: . Then Draws a purple rectangle at (137, 172) with width 59 and height 59. Then Places a red line segment connecting (226, 151) to (166, 117).
; PLAN: r0=137(x), r1=172(y), r2=59(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=226(x1), r1=151(y1), r2=166(x2), r3=117(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple rectangle at (137, 172) with width 59 and height 59.
; PLAN: r0=137(x), r1=172(y), r2=59(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 172
LDI r2, 59
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a red line segment connecting (226, 151) to (166, 117).
; PLAN: r0=226(x1), r1=151(y1), r2=166(x2), r3=117(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 151
LDI r2, 166
LDI r3, 117
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
