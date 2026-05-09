; DESCRIPTION: Draws a black line from (77, 249) to (339, 76).
; PLAN: r0=77(x1), r1=249(y1), r2=339(x2), r3=76(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 249
LDI r2, 339
LDI r3, 76
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
