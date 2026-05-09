; DESCRIPTION: Places a blue line segment connecting (58, 107) to (439, 19).
; PLAN: r0=58(x1), r1=107(y1), r2=439(x2), r3=19(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 107
LDI r2, 439
LDI r3, 19
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
