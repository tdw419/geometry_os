; DESCRIPTION: Places a black line segment connecting (151, 107) to (212, 71).
; PLAN: r0=151(x1), r1=107(y1), r2=212(x2), r3=71(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 107
LDI r2, 212
LDI r3, 71
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
