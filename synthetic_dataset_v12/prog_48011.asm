; DESCRIPTION: Places a green line segment connecting (392, 164) to (478, 144).
; PLAN: r0=392(x1), r1=164(y1), r2=478(x2), r3=144(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 164
LDI r2, 478
LDI r3, 144
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
