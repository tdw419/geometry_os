; DESCRIPTION: Composite: . Then Draws a yellow rectangle at (58, 39) with width 111 and height 12. Then Renders a purple line between points (128, 127) and (88, 37).
; PLAN: r0=58(x), r1=39(y), r2=111(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=128(x1), r1=127(y1), r2=88(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow rectangle at (58, 39) with width 111 and height 12.
; PLAN: r0=58(x), r1=39(y), r2=111(width), r3=12(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 39
LDI r2, 111
LDI r3, 12
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple line between points (128, 127) and (88, 37).
; PLAN: r0=128(x1), r1=127(y1), r2=88(x2), r3=37(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 127
LDI r2, 88
LDI r3, 37
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
