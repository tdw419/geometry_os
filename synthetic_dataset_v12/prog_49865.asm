; DESCRIPTION: Draws a green line from (61, 142) to (371, 80).
; PLAN: r0=61(x1), r1=142(y1), r2=371(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 142
LDI r2, 371
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
