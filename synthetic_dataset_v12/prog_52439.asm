; DESCRIPTION: Renders a magenta line between points (113, 147) and (481, 44).
; PLAN: r0=113(x1), r1=147(y1), r2=481(x2), r3=44(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 147
LDI r2, 481
LDI r3, 44
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
