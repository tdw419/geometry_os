; DESCRIPTION: Composite: . Then Draws a black line from (7, 2) to (108, 211). Then Draws a black rectangle at (137, 41) with width 87 and height 37.
; PLAN: r0=7(x1), r1=2(y1), r2=108(x2), r3=211(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=137(x), r1=41(y), r2=87(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black line from (7, 2) to (108, 211).
; PLAN: r0=7(x1), r1=2(y1), r2=108(x2), r3=211(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 2
LDI r2, 108
LDI r3, 211
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black rectangle at (137, 41) with width 87 and height 37.
; PLAN: r0=137(x), r1=41(y), r2=87(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 41
LDI r2, 87
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
