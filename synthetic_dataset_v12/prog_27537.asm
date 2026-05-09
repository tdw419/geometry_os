; DESCRIPTION: Places a red line segment connecting (235, 143) to (393, 139).
; PLAN: r0=235(x1), r1=143(y1), r2=393(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 143
LDI r2, 393
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
