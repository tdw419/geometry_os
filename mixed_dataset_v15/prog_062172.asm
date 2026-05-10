; DESCRIPTION: Draws a green line from (249, 147) to (102, 151).
; PLAN: r0=249(x1), r1=147(y1), r2=102(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 147
LDI r2, 102
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
