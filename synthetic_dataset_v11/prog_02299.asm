; DESCRIPTION: Places a yellow line segment connecting (250, 254) to (46, 103).
; PLAN: r0=250(x1), r1=254(y1), r2=46(x2), r3=103(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 254
LDI r2, 46
LDI r3, 103
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
