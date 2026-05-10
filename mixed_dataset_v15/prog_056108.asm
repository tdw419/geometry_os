; DESCRIPTION: Places a magenta line segment connecting (271, 71) to (412, 122).
; PLAN: r0=271(x1), r1=71(y1), r2=412(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 71
LDI r2, 412
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
