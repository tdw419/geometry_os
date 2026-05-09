; DESCRIPTION: Composite: . Then Renders a orange line between points (91, 231) and (223, 138). Then Draws a orange rectangle at (67, 106) with width 70 and height 97.
; PLAN: r0=91(x1), r1=231(y1), r2=223(x2), r3=138(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=67(x), r1=106(y), r2=70(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange line between points (91, 231) and (223, 138).
; PLAN: r0=91(x1), r1=231(y1), r2=223(x2), r3=138(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 231
LDI r2, 223
LDI r3, 138
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange rectangle at (67, 106) with width 70 and height 97.
; PLAN: r0=67(x), r1=106(y), r2=70(width), r3=97(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 106
LDI r2, 70
LDI r3, 97
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
