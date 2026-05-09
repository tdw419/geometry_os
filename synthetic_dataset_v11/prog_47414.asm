; DESCRIPTION: Composite: . Then Renders a black line between points (99, 207) and (8, 100). Then Draws a orange rectangle at (161, 97) with width 72 and height 76.
; PLAN: r0=99(x1), r1=207(y1), r2=8(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=161(x), r1=97(y), r2=72(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a black line between points (99, 207) and (8, 100).
; PLAN: r0=99(x1), r1=207(y1), r2=8(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 207
LDI r2, 8
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange rectangle at (161, 97) with width 72 and height 76.
; PLAN: r0=161(x), r1=97(y), r2=72(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 97
LDI r2, 72
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
