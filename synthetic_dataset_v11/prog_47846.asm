; DESCRIPTION: Places a blue line segment connecting (117, 170) to (157, 235).
; PLAN: r0=117(x1), r1=170(y1), r2=157(x2), r3=235(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 170
LDI r2, 157
LDI r3, 235
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
