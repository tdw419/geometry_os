; DESCRIPTION: Places a magenta line segment connecting (82, 65) to (106, 45).
; PLAN: r0=82(x1), r1=65(y1), r2=106(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 65
LDI r2, 106
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
