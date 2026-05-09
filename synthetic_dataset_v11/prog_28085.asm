; DESCRIPTION: Renders a magenta line between points (227, 235) and (64, 132).
; PLAN: r0=227(x1), r1=235(y1), r2=64(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 235
LDI r2, 64
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
