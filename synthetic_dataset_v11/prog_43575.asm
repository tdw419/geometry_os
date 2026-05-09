; DESCRIPTION: Composite: . Then Renders a purple line between points (59, 156) and (185, 3). Then Draws a red rectangle at (170, 33) with width 10 and height 11.
; PLAN: r0=59(x1), r1=156(y1), r2=185(x2), r3=3(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=170(x), r1=33(y), r2=10(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple line between points (59, 156) and (185, 3).
; PLAN: r0=59(x1), r1=156(y1), r2=185(x2), r3=3(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 156
LDI r2, 185
LDI r3, 3
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red rectangle at (170, 33) with width 10 and height 11.
; PLAN: r0=170(x), r1=33(y), r2=10(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 33
LDI r2, 10
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
