; DESCRIPTION: Draws a blue line from (94, 192) to (254, 45).
; PLAN: r0=94(x1), r1=192(y1), r2=254(x2), r3=45(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 192
LDI r2, 254
LDI r3, 45
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
