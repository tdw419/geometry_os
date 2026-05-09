; DESCRIPTION: Draws a green line from (96, 62) to (133, 20).
; PLAN: r0=96(x1), r1=62(y1), r2=133(x2), r3=20(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 62
LDI r2, 133
LDI r3, 20
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
