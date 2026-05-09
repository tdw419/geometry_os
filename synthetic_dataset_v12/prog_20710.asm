; DESCRIPTION: Renders a green line between points (250, 240) and (469, 218).
; PLAN: r0=250(x1), r1=240(y1), r2=469(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 240
LDI r2, 469
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
