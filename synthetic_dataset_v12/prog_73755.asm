; DESCRIPTION: Draws a yellow line from (225, 201) to (180, 219).
; PLAN: r0=225(x1), r1=201(y1), r2=180(x2), r3=219(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 201
LDI r2, 180
LDI r3, 219
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
