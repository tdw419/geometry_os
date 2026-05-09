; DESCRIPTION: Renders a magenta line between points (384, 153) and (423, 132).
; PLAN: r0=384(x1), r1=153(y1), r2=423(x2), r3=132(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 153
LDI r2, 423
LDI r3, 132
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
