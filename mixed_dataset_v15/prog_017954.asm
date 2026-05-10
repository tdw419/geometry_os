; DESCRIPTION: Places a magenta line segment connecting (470, 234) to (351, 207).
; PLAN: r0=470(x1), r1=234(y1), r2=351(x2), r3=207(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 234
LDI r2, 351
LDI r3, 207
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
