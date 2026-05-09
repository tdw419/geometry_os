; DESCRIPTION: Draws a green line from (249, 137) to (47, 108).
; PLAN: r0=249(x1), r1=137(y1), r2=47(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 137
LDI r2, 47
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
