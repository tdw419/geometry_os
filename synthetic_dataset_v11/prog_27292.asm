; DESCRIPTION: Composite: . Then Draws a black rectangle at (93, 80) with width 99 and height 67. Then Draws a red line from (130, 80) to (243, 129).
; PLAN: r0=93(x), r1=80(y), r2=99(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=130(x1), r1=80(y1), r2=243(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black rectangle at (93, 80) with width 99 and height 67.
; PLAN: r0=93(x), r1=80(y), r2=99(width), r3=67(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 80
LDI r2, 99
LDI r3, 67
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red line from (130, 80) to (243, 129).
; PLAN: r0=130(x1), r1=80(y1), r2=243(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 80
LDI r2, 243
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
