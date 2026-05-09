; DESCRIPTION: Composite: . Then Renders a red line between points (7, 245) and (253, 30). Then Draws a yellow rectangle at (82, 35) with width 22 and height 117.
; PLAN: r0=7(x1), r1=245(y1), r2=253(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=82(x), r1=35(y), r2=22(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red line between points (7, 245) and (253, 30).
; PLAN: r0=7(x1), r1=245(y1), r2=253(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 245
LDI r2, 253
LDI r3, 30
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a yellow rectangle at (82, 35) with width 22 and height 117.
; PLAN: r0=82(x), r1=35(y), r2=22(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 35
LDI r2, 22
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
