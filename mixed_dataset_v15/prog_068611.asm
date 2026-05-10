; DESCRIPTION: Places a blue line segment connecting (283, 44) to (263, 9).
; PLAN: r0=283(x1), r1=44(y1), r2=263(x2), r3=9(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 44
LDI r2, 263
LDI r3, 9
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
