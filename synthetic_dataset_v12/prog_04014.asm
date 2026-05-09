; DESCRIPTION: Places a cyan line segment connecting (311, 177) to (235, 20).
; PLAN: r0=311(x1), r1=177(y1), r2=235(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 177
LDI r2, 235
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
