; DESCRIPTION: Places a green line segment connecting (111, 162) to (235, 94).
; PLAN: r0=111(x1), r1=162(y1), r2=235(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 162
LDI r2, 235
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
