; DESCRIPTION: Places a magenta line segment connecting (389, 154) to (372, 138).
; PLAN: r0=389(x1), r1=154(y1), r2=372(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 154
LDI r2, 372
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
