; DESCRIPTION: Composite: . Then Draws a green rectangle at (130, 68) with width 50 and height 83. Then Draws a black line from (187, 127) to (188, 7).
; PLAN: r0=130(x), r1=68(y), r2=50(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=187(x1), r1=127(y1), r2=188(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green rectangle at (130, 68) with width 50 and height 83.
; PLAN: r0=130(x), r1=68(y), r2=50(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 68
LDI r2, 50
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black line from (187, 127) to (188, 7).
; PLAN: r0=187(x1), r1=127(y1), r2=188(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 127
LDI r2, 188
LDI r3, 7
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
