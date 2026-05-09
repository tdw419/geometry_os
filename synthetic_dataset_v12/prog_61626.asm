; DESCRIPTION: Places a magenta line segment connecting (311, 79) to (392, 59).
; PLAN: r0=311(x1), r1=79(y1), r2=392(x2), r3=59(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 79
LDI r2, 392
LDI r3, 59
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
