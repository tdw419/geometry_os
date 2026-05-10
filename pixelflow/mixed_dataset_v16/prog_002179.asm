; DESCRIPTION: Places a magenta line segment connecting (304, 185) to (393, 238).
; PLAN: r0=304(x1), r1=185(y1), r2=393(x2), r3=238(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 185
LDI r2, 393
LDI r3, 238
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
