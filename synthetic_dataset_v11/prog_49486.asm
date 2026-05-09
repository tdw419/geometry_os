; DESCRIPTION: Places a magenta line segment connecting (236, 138) to (248, 235).
; PLAN: r0=236(x1), r1=138(y1), r2=248(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 138
LDI r2, 248
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
