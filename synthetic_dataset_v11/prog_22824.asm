; DESCRIPTION: Places a magenta line segment connecting (195, 189) to (106, 182).
; PLAN: r0=195(x1), r1=189(y1), r2=106(x2), r3=182(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 189
LDI r2, 106
LDI r3, 182
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
