; DESCRIPTION: Places a black line segment connecting (362, 24) to (493, 76).
; PLAN: r0=362(x1), r1=24(y1), r2=493(x2), r3=76(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 24
LDI r2, 493
LDI r3, 76
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
