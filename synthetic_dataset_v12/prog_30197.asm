; DESCRIPTION: Renders a magenta line between points (51, 206) and (234, 235).
; PLAN: r0=51(x1), r1=206(y1), r2=234(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 206
LDI r2, 234
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
