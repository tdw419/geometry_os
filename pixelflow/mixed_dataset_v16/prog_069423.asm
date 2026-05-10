; DESCRIPTION: Draws a green line from (323, 141) to (469, 87).
; PLAN: r0=323(x1), r1=141(y1), r2=469(x2), r3=87(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 141
LDI r2, 469
LDI r3, 87
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
