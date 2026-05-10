; DESCRIPTION: Draws a yellow line from (431, 30) to (152, 218).
; PLAN: r0=431(x1), r1=30(y1), r2=152(x2), r3=218(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 30
LDI r2, 152
LDI r3, 218
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
