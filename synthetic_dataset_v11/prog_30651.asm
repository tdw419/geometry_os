; DESCRIPTION: Composite: . Then Places a white circle of radius 27 at center (132, 79). Then Draws a purple line from (227, 160) to (182, 235).
; PLAN: r0=132(x), r1=79(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=227(x1), r1=160(y1), r2=182(x2), r3=235(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white circle of radius 27 at center (132, 79).
; PLAN: r0=132(x), r1=79(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 132
LDI r1, 79
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a purple line from (227, 160) to (182, 235).
; PLAN: r0=227(x1), r1=160(y1), r2=182(x2), r3=235(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 160
LDI r2, 182
LDI r3, 235
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
