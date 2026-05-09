; DESCRIPTION: Places a purple line segment connecting (293, 174) to (467, 125).
; PLAN: r0=293(x1), r1=174(y1), r2=467(x2), r3=125(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 174
LDI r2, 467
LDI r3, 125
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
