; DESCRIPTION: Places a magenta line segment connecting (231, 114) to (191, 142).
; PLAN: r0=231(x1), r1=114(y1), r2=191(x2), r3=142(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 114
LDI r2, 191
LDI r3, 142
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
