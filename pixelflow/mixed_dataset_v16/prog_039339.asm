; DESCRIPTION: Places a magenta line segment connecting (509, 59) to (109, 138).
; PLAN: r0=509(x1), r1=59(y1), r2=109(x2), r3=138(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 59
LDI r2, 109
LDI r3, 138
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
