; DESCRIPTION: Places a black line segment connecting (156, 5) to (373, 202).
; PLAN: r0=156(x1), r1=5(y1), r2=373(x2), r3=202(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 5
LDI r2, 373
LDI r3, 202
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
