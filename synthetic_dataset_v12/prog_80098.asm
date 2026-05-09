; DESCRIPTION: Places a black line segment connecting (196, 150) to (113, 179).
; PLAN: r0=196(x1), r1=150(y1), r2=113(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 150
LDI r2, 113
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
