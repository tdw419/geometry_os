; DESCRIPTION: Draws a green line from (141, 56) to (428, 8).
; PLAN: r0=141(x1), r1=56(y1), r2=428(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 56
LDI r2, 428
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
