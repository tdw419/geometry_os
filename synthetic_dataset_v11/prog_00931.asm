; DESCRIPTION: Places a black line segment connecting (188, 220) to (98, 184).
; PLAN: r0=188(x1), r1=220(y1), r2=98(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 220
LDI r2, 98
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
