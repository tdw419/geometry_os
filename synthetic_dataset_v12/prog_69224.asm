; DESCRIPTION: Renders a magenta line between points (258, 140) and (165, 235).
; PLAN: r0=258(x1), r1=140(y1), r2=165(x2), r3=235(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 140
LDI r2, 165
LDI r3, 235
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
