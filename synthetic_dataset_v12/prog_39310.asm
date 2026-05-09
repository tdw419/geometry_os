; DESCRIPTION: Draws a purple line from (289, 26) to (331, 174).
; PLAN: r0=289(x1), r1=26(y1), r2=331(x2), r3=174(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 26
LDI r2, 331
LDI r3, 174
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
