; DESCRIPTION: Places a green line segment connecting (63, 77) to (269, 208).
; PLAN: r0=63(x1), r1=77(y1), r2=269(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 77
LDI r2, 269
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
