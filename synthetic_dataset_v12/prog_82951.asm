; DESCRIPTION: Draws a blue line from (277, 1) to (449, 45).
; PLAN: r0=277(x1), r1=1(y1), r2=449(x2), r3=45(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 1
LDI r2, 449
LDI r3, 45
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
