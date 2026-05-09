; DESCRIPTION: Places a green line segment connecting (251, 37) to (320, 133).
; PLAN: r0=251(x1), r1=37(y1), r2=320(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 37
LDI r2, 320
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
