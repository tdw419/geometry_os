; DESCRIPTION: Places a green line segment connecting (63, 38) to (439, 98).
; PLAN: r0=63(x1), r1=38(y1), r2=439(x2), r3=98(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 38
LDI r2, 439
LDI r3, 98
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
