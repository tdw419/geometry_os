; DESCRIPTION: Draws a yellow line from (351, 71) to (487, 43).
; PLAN: r0=351(x1), r1=71(y1), r2=487(x2), r3=43(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 71
LDI r2, 487
LDI r3, 43
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
