; DESCRIPTION: Places a white line segment connecting (460, 51) to (70, 8).
; PLAN: r0=460(x1), r1=51(y1), r2=70(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 51
LDI r2, 70
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
