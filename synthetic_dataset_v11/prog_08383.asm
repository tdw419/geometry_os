; DESCRIPTION: Composite: . Then Draws a orange line from (209, 11) to (231, 196). Then Places a red circle of radius 53 at center (97, 185).
; PLAN: r0=209(x1), r1=11(y1), r2=231(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=97(x), r1=185(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a orange line from (209, 11) to (231, 196).
; PLAN: r0=209(x1), r1=11(y1), r2=231(x2), r3=196(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 11
LDI r2, 231
LDI r3, 196
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red circle of radius 53 at center (97, 185).
; PLAN: r0=97(x), r1=185(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 97
LDI r1, 185
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
