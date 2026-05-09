; DESCRIPTION: Places a magenta line segment connecting (403, 241) to (440, 70).
; PLAN: r0=403(x1), r1=241(y1), r2=440(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 241
LDI r2, 440
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
