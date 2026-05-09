; DESCRIPTION: Places a magenta line segment connecting (9, 138) to (235, 86).
; PLAN: r0=9(x1), r1=138(y1), r2=235(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 138
LDI r2, 235
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
