; DESCRIPTION: Places a green line segment connecting (65, 211) to (235, 139).
; PLAN: r0=65(x1), r1=211(y1), r2=235(x2), r3=139(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 211
LDI r2, 235
LDI r3, 139
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
