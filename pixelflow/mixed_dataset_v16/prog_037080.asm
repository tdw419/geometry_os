; DESCRIPTION: Draws a blue line from (331, 82) to (218, 100).
; PLAN: r0=331(x1), r1=82(y1), r2=218(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 82
LDI r2, 218
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
