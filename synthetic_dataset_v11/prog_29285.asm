; DESCRIPTION: Places a black line segment connecting (160, 142) to (188, 103).
; PLAN: r0=160(x1), r1=142(y1), r2=188(x2), r3=103(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 142
LDI r2, 188
LDI r3, 103
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
