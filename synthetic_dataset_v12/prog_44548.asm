; DESCRIPTION: Places a magenta line segment connecting (51, 124) to (460, 80).
; PLAN: r0=51(x1), r1=124(y1), r2=460(x2), r3=80(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 124
LDI r2, 460
LDI r3, 80
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
