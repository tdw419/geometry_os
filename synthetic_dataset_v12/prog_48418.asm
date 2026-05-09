; DESCRIPTION: Draws a black line from (12, 235) to (427, 231).
; PLAN: r0=12(x1), r1=235(y1), r2=427(x2), r3=231(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 235
LDI r2, 427
LDI r3, 231
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
