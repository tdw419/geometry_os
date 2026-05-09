; DESCRIPTION: Places a red line segment connecting (260, 201) to (354, 237).
; PLAN: r0=260(x1), r1=201(y1), r2=354(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 201
LDI r2, 354
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
