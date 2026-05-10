; DESCRIPTION: Places a magenta line segment connecting (385, 63) to (321, 121).
; PLAN: r0=385(x1), r1=63(y1), r2=321(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 63
LDI r2, 321
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
