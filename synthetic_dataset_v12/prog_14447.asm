; DESCRIPTION: Places a yellow line segment connecting (164, 4) to (120, 142).
; PLAN: r0=164(x1), r1=4(y1), r2=120(x2), r3=142(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 4
LDI r2, 120
LDI r3, 142
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
