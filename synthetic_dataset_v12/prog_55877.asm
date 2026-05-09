; DESCRIPTION: Places a green line segment connecting (226, 17) to (0, 82).
; PLAN: r0=226(x1), r1=17(y1), r2=0(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 17
LDI r2, 0
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
