; DESCRIPTION: Places a black line segment connecting (215, 89) to (212, 87).
; PLAN: r0=215(x1), r1=89(y1), r2=212(x2), r3=87(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 89
LDI r2, 212
LDI r3, 87
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
