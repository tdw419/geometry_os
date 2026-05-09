; DESCRIPTION: Draws a yellow line from (87, 32) to (47, 80).
; PLAN: r0=87(x1), r1=32(y1), r2=47(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 32
LDI r2, 47
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
