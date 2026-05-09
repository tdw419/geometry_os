; DESCRIPTION: Places a magenta line segment connecting (143, 235) to (220, 133).
; PLAN: r0=143(x1), r1=235(y1), r2=220(x2), r3=133(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 235
LDI r2, 220
LDI r3, 133
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
