; DESCRIPTION: Places a purple line segment connecting (206, 4) to (211, 117).
; PLAN: r0=206(x1), r1=4(y1), r2=211(x2), r3=117(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 4
LDI r2, 211
LDI r3, 117
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
