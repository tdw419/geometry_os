; DESCRIPTION: Draws a yellow line from (351, 182) to (392, 72).
; PLAN: r0=351(x1), r1=182(y1), r2=392(x2), r3=72(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 182
LDI r2, 392
LDI r3, 72
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
