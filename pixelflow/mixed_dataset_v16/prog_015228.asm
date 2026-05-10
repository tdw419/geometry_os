; DESCRIPTION: Places a magenta line segment connecting (396, 71) to (82, 175).
; PLAN: r0=396(x1), r1=71(y1), r2=82(x2), r3=175(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 71
LDI r2, 82
LDI r3, 175
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
