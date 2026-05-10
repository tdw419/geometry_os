; DESCRIPTION: Places a green line segment connecting (343, 111) to (165, 235).
; PLAN: r0=343(x1), r1=111(y1), r2=165(x2), r3=235(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 111
LDI r2, 165
LDI r3, 235
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
