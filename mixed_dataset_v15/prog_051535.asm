; DESCRIPTION: Places a purple line segment connecting (305, 107) to (181, 174).
; PLAN: r0=305(x1), r1=107(y1), r2=181(x2), r3=174(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 107
LDI r2, 181
LDI r3, 174
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
