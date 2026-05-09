; DESCRIPTION: Places a green line segment connecting (335, 222) to (95, 13).
; PLAN: r0=335(x1), r1=222(y1), r2=95(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 222
LDI r2, 95
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
