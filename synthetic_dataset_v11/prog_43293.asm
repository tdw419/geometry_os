; DESCRIPTION: Places a green line segment connecting (121, 92) to (56, 249).
; PLAN: r0=121(x1), r1=92(y1), r2=56(x2), r3=249(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 92
LDI r2, 56
LDI r3, 249
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
