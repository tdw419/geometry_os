; DESCRIPTION: Composite: . Then Draws a yellow rectangle at (79, 137) with width 67 and height 76. Then Renders a black line between points (147, 232) and (174, 5).
; PLAN: r0=79(x), r1=137(y), r2=67(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=147(x1), r1=232(y1), r2=174(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a yellow rectangle at (79, 137) with width 67 and height 76.
; PLAN: r0=79(x), r1=137(y), r2=67(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 137
LDI r2, 67
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a black line between points (147, 232) and (174, 5).
; PLAN: r0=147(x1), r1=232(y1), r2=174(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 232
LDI r2, 174
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
