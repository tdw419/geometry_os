; DESCRIPTION: Places a white line segment connecting (422, 235) to (159, 144).
; PLAN: r0=422(x1), r1=235(y1), r2=159(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 235
LDI r2, 159
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
