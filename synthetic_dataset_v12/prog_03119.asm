; DESCRIPTION: Places a magenta line segment connecting (237, 171) to (345, 38).
; PLAN: r0=237(x1), r1=171(y1), r2=345(x2), r3=38(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 171
LDI r2, 345
LDI r3, 38
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
