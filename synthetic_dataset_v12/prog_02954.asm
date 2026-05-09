; DESCRIPTION: Places a green line segment connecting (175, 241) to (462, 235).
; PLAN: r0=175(x1), r1=241(y1), r2=462(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 241
LDI r2, 462
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
