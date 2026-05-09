; DESCRIPTION: Draws a yellow line from (431, 16) to (110, 30).
; PLAN: r0=431(x1), r1=16(y1), r2=110(x2), r3=30(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 16
LDI r2, 110
LDI r3, 30
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
