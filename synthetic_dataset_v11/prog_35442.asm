; DESCRIPTION: Places a magenta line segment connecting (235, 171) to (212, 188).
; PLAN: r0=235(x1), r1=171(y1), r2=212(x2), r3=188(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 171
LDI r2, 212
LDI r3, 188
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
