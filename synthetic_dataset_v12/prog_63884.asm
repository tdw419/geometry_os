; DESCRIPTION: Places a white line segment connecting (317, 237) to (364, 71).
; PLAN: r0=317(x1), r1=237(y1), r2=364(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 237
LDI r2, 364
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
