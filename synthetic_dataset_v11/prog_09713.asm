; DESCRIPTION: Places a cyan line segment connecting (100, 235) to (200, 49).
; PLAN: r0=100(x1), r1=235(y1), r2=200(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 235
LDI r2, 200
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
