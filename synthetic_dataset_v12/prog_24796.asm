; DESCRIPTION: Places a cyan line segment connecting (147, 26) to (466, 235).
; PLAN: r0=147(x1), r1=26(y1), r2=466(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 26
LDI r2, 466
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
