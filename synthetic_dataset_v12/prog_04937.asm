; DESCRIPTION: Places a green line segment connecting (196, 51) to (100, 238).
; PLAN: r0=196(x1), r1=51(y1), r2=100(x2), r3=238(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 51
LDI r2, 100
LDI r3, 238
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
