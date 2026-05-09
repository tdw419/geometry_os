; DESCRIPTION: Composite: . Then Places a red line segment connecting (122, 245) to (49, 15). Then Renders a blue box of size 22x18 starting at (218, 35).
; PLAN: r0=122(x1), r1=245(y1), r2=49(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=218(x), r1=35(y), r2=22(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red line segment connecting (122, 245) to (49, 15).
; PLAN: r0=122(x1), r1=245(y1), r2=49(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 245
LDI r2, 49
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a blue box of size 22x18 starting at (218, 35).
; PLAN: r0=218(x), r1=35(y), r2=22(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 35
LDI r2, 22
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
