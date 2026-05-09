; DESCRIPTION: Composite: . Then Renders a purple line between points (10, 133) and (14, 97). Then Renders a purple disk with center (70, 173) and radius 26.
; PLAN: r0=10(x1), r1=133(y1), r2=14(x2), r3=97(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=70(x), r1=173(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a purple line between points (10, 133) and (14, 97).
; PLAN: r0=10(x1), r1=133(y1), r2=14(x2), r3=97(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 133
LDI r2, 14
LDI r3, 97
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple disk with center (70, 173) and radius 26.
; PLAN: r0=70(x), r1=173(y), r2=26(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 173
LDI r2, 26
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
