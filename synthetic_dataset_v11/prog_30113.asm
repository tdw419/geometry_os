; DESCRIPTION: Places a green line segment connecting (118, 236) to (72, 18).
; PLAN: r0=118(x1), r1=236(y1), r2=72(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 236
LDI r2, 72
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
