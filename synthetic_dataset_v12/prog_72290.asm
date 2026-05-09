; DESCRIPTION: Places a blue line segment connecting (264, 220) to (449, 202).
; PLAN: r0=264(x1), r1=220(y1), r2=449(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 220
LDI r2, 449
LDI r3, 202
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
