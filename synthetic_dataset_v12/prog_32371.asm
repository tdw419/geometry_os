; DESCRIPTION: Places a black line segment connecting (113, 111) to (448, 84).
; PLAN: r0=113(x1), r1=111(y1), r2=448(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 111
LDI r2, 448
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
