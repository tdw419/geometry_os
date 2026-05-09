; DESCRIPTION: Composite: . Then Draws a purple circle centered at (89, 133) with radius 74. Then Draws a yellow line from (138, 90) to (234, 138).
; PLAN: r0=89(x), r1=133(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=138(x1), r1=90(y1), r2=234(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple circle centered at (89, 133) with radius 74.
; PLAN: r0=89(x), r1=133(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 133
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a yellow line from (138, 90) to (234, 138).
; PLAN: r0=138(x1), r1=90(y1), r2=234(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 90
LDI r2, 234
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
