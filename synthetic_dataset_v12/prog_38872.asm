; DESCRIPTION: Draws a yellow line from (371, 74) to (396, 106).
; PLAN: r0=371(x1), r1=74(y1), r2=396(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 74
LDI r2, 396
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
