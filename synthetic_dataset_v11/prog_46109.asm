; DESCRIPTION: Places a blue line segment connecting (31, 223) to (56, 174).
; PLAN: r0=31(x1), r1=223(y1), r2=56(x2), r3=174(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 223
LDI r2, 56
LDI r3, 174
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
