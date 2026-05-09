; DESCRIPTION: Places a magenta line segment connecting (87, 220) to (97, 221).
; PLAN: r0=87(x1), r1=220(y1), r2=97(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 220
LDI r2, 97
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
