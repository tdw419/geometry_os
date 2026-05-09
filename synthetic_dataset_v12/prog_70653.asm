; DESCRIPTION: Renders a magenta line between points (325, 235) and (195, 62).
; PLAN: r0=325(x1), r1=235(y1), r2=195(x2), r3=62(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 235
LDI r2, 195
LDI r3, 62
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
