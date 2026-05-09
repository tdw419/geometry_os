; DESCRIPTION: Places a yellow line segment connecting (237, 120) to (225, 72).
; PLAN: r0=237(x1), r1=120(y1), r2=225(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 120
LDI r2, 225
LDI r3, 72
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
