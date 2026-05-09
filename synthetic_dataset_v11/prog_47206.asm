; DESCRIPTION: Composite: . Then Renders a purple line between points (207, 86) and (231, 38). Then Creates a yellow rectangular region at (159, 58) spanning 96 by 84 pixels.
; PLAN: r0=207(x1), r1=86(y1), r2=231(x2), r3=38(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=159(x), r1=58(y), r2=96(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple line between points (207, 86) and (231, 38).
; PLAN: r0=207(x1), r1=86(y1), r2=231(x2), r3=38(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 86
LDI r2, 231
LDI r3, 38
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow rectangular region at (159, 58) spanning 96 by 84 pixels.
; PLAN: r0=159(x), r1=58(y), r2=96(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 58
LDI r2, 96
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
