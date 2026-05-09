; DESCRIPTION: Places a magenta line segment connecting (399, 45) to (336, 121).
; PLAN: r0=399(x1), r1=45(y1), r2=336(x2), r3=121(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 45
LDI r2, 336
LDI r3, 121
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
