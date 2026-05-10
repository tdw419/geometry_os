; DESCRIPTION: Draws a blue line from (106, 115) to (480, 51).
; PLAN: r0=106(x1), r1=115(y1), r2=480(x2), r3=51(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 115
LDI r2, 480
LDI r3, 51
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
