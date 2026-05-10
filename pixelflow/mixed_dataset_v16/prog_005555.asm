; DESCRIPTION: Places a magenta line segment connecting (196, 113) to (388, 241).
; PLAN: r0=196(x1), r1=113(y1), r2=388(x2), r3=241(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 113
LDI r2, 388
LDI r3, 241
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
