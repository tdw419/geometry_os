; DESCRIPTION: Places a white line segment connecting (212, 197) to (388, 114).
; PLAN: r0=212(x1), r1=197(y1), r2=388(x2), r3=114(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 197
LDI r2, 388
LDI r3, 114
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
