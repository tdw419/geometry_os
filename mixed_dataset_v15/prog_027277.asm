; DESCRIPTION: Places a magenta line segment connecting (214, 180) to (177, 165).
; PLAN: r0=214(x1), r1=180(y1), r2=177(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 180
LDI r2, 177
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
