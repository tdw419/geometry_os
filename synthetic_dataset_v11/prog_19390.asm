; DESCRIPTION: Composite: . Then Renders a orange disk with center (86, 179) and radius 65. Then Draws a purple line from (124, 141) to (207, 77).
; PLAN: r0=86(x), r1=179(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=124(x1), r1=141(y1), r2=207(x2), r3=77(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange disk with center (86, 179) and radius 65.
; PLAN: r0=86(x), r1=179(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 179
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a purple line from (124, 141) to (207, 77).
; PLAN: r0=124(x1), r1=141(y1), r2=207(x2), r3=77(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 141
LDI r2, 207
LDI r3, 77
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
