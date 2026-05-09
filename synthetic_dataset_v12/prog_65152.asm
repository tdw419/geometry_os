; DESCRIPTION: Places a green line segment connecting (464, 5) to (22, 119).
; PLAN: r0=464(x1), r1=5(y1), r2=22(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 5
LDI r2, 22
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
