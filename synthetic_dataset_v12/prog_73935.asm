; DESCRIPTION: Draws a black line from (405, 216) to (289, 45).
; PLAN: r0=405(x1), r1=216(y1), r2=289(x2), r3=45(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 216
LDI r2, 289
LDI r3, 45
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
