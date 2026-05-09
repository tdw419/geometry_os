; DESCRIPTION: Places a yellow line segment connecting (63, 44) to (87, 194).
; PLAN: r0=63(x1), r1=44(y1), r2=87(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 44
LDI r2, 87
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
