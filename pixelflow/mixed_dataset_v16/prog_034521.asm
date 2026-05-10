; DESCRIPTION: Places a magenta line segment connecting (273, 149) to (194, 171).
; PLAN: r0=273(x1), r1=149(y1), r2=194(x2), r3=171(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 149
LDI r2, 194
LDI r3, 171
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
