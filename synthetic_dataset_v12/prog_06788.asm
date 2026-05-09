; DESCRIPTION: Places a green line segment connecting (92, 240) to (363, 240).
; PLAN: r0=92(x1), r1=240(y1), r2=363(x2), r3=240(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 240
LDI r2, 363
LDI r3, 240
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
