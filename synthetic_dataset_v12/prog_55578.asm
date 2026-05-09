; DESCRIPTION: Renders a cyan line between points (34, 252) and (378, 235).
; PLAN: r0=34(x1), r1=252(y1), r2=378(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 252
LDI r2, 378
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
