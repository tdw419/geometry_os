; DESCRIPTION: Places a green line segment connecting (70, 131) to (37, 214).
; PLAN: r0=70(x1), r1=131(y1), r2=37(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 131
LDI r2, 37
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
