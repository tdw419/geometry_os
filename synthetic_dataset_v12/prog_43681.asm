; DESCRIPTION: Places a magenta line segment connecting (465, 79) to (86, 235).
; PLAN: r0=465(x1), r1=79(y1), r2=86(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 79
LDI r2, 86
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
