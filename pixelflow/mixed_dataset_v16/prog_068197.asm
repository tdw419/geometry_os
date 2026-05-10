; DESCRIPTION: Places a yellow line segment connecting (195, 99) to (464, 25).
; PLAN: r0=195(x1), r1=99(y1), r2=464(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 99
LDI r2, 464
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
