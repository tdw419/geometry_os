; DESCRIPTION: Draws a blue line from (53, 124) to (75, 17).
; PLAN: r0=53(x1), r1=124(y1), r2=75(x2), r3=17(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 124
LDI r2, 75
LDI r3, 17
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
