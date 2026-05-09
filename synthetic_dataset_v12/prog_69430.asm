; DESCRIPTION: Places a magenta line segment connecting (280, 118) to (418, 171).
; PLAN: r0=280(x1), r1=118(y1), r2=418(x2), r3=171(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 118
LDI r2, 418
LDI r3, 171
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
