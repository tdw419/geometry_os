; DESCRIPTION: Composite: . Then Draws a orange line from (170, 30) to (21, 119). Then Renders a yellow box of size 67x65 starting at (13, 26).
; PLAN: r0=170(x1), r1=30(y1), r2=21(x2), r3=119(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=13(x), r1=26(y), r2=67(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange line from (170, 30) to (21, 119).
; PLAN: r0=170(x1), r1=30(y1), r2=21(x2), r3=119(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 30
LDI r2, 21
LDI r3, 119
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow box of size 67x65 starting at (13, 26).
; PLAN: r0=13(x), r1=26(y), r2=67(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 26
LDI r2, 67
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
