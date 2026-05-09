; DESCRIPTION: Places a green line segment connecting (151, 62) to (51, 3).
; PLAN: r0=151(x1), r1=62(y1), r2=51(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 62
LDI r2, 51
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
