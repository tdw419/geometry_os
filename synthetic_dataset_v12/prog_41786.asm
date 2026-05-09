; DESCRIPTION: Places a green line segment connecting (160, 189) to (150, 133).
; PLAN: r0=160(x1), r1=189(y1), r2=150(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 189
LDI r2, 150
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
