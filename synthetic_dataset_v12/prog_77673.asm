; DESCRIPTION: Places a blue line segment connecting (105, 221) to (392, 133).
; PLAN: r0=105(x1), r1=221(y1), r2=392(x2), r3=133(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 221
LDI r2, 392
LDI r3, 133
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
