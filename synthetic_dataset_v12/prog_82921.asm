; DESCRIPTION: Draws a blue line from (499, 162) to (402, 124).
; PLAN: r0=499(x1), r1=162(y1), r2=402(x2), r3=124(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 162
LDI r2, 402
LDI r3, 124
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
