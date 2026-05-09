; DESCRIPTION: Places a green line segment connecting (51, 180) to (80, 132).
; PLAN: r0=51(x1), r1=180(y1), r2=80(x2), r3=132(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 180
LDI r2, 80
LDI r3, 132
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
