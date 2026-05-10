; DESCRIPTION: Places a blue line segment connecting (63, 4) to (65, 142).
; PLAN: r0=63(x1), r1=4(y1), r2=65(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 4
LDI r2, 65
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
