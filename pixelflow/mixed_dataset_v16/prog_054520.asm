; DESCRIPTION: Places a magenta line segment connecting (231, 235) to (46, 94).
; PLAN: r0=231(x1), r1=235(y1), r2=46(x2), r3=94(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 235
LDI r2, 46
LDI r3, 94
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
