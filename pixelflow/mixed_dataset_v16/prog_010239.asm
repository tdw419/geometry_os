; DESCRIPTION: Draws a yellow line from (458, 235) to (66, 221).
; PLAN: r0=458(x1), r1=235(y1), r2=66(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 235
LDI r2, 66
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
