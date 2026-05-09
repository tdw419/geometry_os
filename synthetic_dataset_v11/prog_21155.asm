; DESCRIPTION: Composite: . Then Renders a red disk with center (125, 66) and radius 65. Then Places a purple line segment connecting (127, 16) to (212, 78).
; PLAN: r0=125(x), r1=66(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=127(x1), r1=16(y1), r2=212(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red disk with center (125, 66) and radius 65.
; PLAN: r0=125(x), r1=66(y), r2=65(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 66
LDI r2, 65
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a purple line segment connecting (127, 16) to (212, 78).
; PLAN: r0=127(x1), r1=16(y1), r2=212(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 16
LDI r2, 212
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
