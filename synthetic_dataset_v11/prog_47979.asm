; DESCRIPTION: Composite: . Then Creates a black circular shape at (124, 97) with radius 76. Then Draws a purple line from (172, 33) to (69, 226).
; PLAN: r0=124(x), r1=97(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=172(x1), r1=33(y1), r2=69(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a black circular shape at (124, 97) with radius 76.
; PLAN: r0=124(x), r1=97(y), r2=76(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 97
LDI r2, 76
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a purple line from (172, 33) to (69, 226).
; PLAN: r0=172(x1), r1=33(y1), r2=69(x2), r3=226(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 33
LDI r2, 69
LDI r3, 226
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
