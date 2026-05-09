; DESCRIPTION: Places a black line segment connecting (4, 86) to (362, 33).
; PLAN: r0=4(x1), r1=86(y1), r2=362(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 86
LDI r2, 362
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
