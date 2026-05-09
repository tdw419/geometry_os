; DESCRIPTION: Places a green line segment connecting (388, 51) to (127, 196).
; PLAN: r0=388(x1), r1=51(y1), r2=127(x2), r3=196(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 51
LDI r2, 127
LDI r3, 196
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
