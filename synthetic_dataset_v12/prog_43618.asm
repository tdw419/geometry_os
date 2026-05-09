; DESCRIPTION: Places a green line segment connecting (251, 254) to (280, 36).
; PLAN: r0=251(x1), r1=254(y1), r2=280(x2), r3=36(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 254
LDI r2, 280
LDI r3, 36
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
