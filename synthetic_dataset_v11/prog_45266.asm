; DESCRIPTION: Places a magenta line segment connecting (176, 214) to (230, 155).
; PLAN: r0=176(x1), r1=214(y1), r2=230(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 214
LDI r2, 230
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
