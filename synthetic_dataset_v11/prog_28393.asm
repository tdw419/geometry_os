; DESCRIPTION: Places a blue line segment connecting (138, 147) to (151, 213).
; PLAN: r0=138(x1), r1=147(y1), r2=151(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 147
LDI r2, 151
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
