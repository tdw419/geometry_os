; DESCRIPTION: Draws a blue line from (227, 162) to (298, 61).
; PLAN: r0=227(x1), r1=162(y1), r2=298(x2), r3=61(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 162
LDI r2, 298
LDI r3, 61
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
