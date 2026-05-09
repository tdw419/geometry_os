; DESCRIPTION: Renders a purple line between points (440, 51) and (398, 38).
; PLAN: r0=440(x1), r1=51(y1), r2=398(x2), r3=38(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 51
LDI r2, 398
LDI r3, 38
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
