; DESCRIPTION: Places a blue line segment connecting (176, 87) to (502, 97).
; PLAN: r0=176(x1), r1=87(y1), r2=502(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 87
LDI r2, 502
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
