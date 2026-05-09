; DESCRIPTION: Places a black line segment connecting (209, 229) to (449, 220).
; PLAN: r0=209(x1), r1=229(y1), r2=449(x2), r3=220(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 229
LDI r2, 449
LDI r3, 220
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
