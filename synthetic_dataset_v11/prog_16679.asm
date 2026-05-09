; DESCRIPTION: Renders a magenta line between points (160, 123) and (235, 223).
; PLAN: r0=160(x1), r1=123(y1), r2=235(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 123
LDI r2, 235
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
