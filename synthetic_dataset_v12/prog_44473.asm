; DESCRIPTION: Places a magenta line segment connecting (277, 120) to (418, 74).
; PLAN: r0=277(x1), r1=120(y1), r2=418(x2), r3=74(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 120
LDI r2, 418
LDI r3, 74
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
