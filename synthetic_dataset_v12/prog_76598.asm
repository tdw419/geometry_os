; DESCRIPTION: Places a magenta line segment connecting (511, 14) to (180, 248).
; PLAN: r0=511(x1), r1=14(y1), r2=180(x2), r3=248(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 14
LDI r2, 180
LDI r3, 248
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
