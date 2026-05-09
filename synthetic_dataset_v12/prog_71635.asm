; DESCRIPTION: Places a red line segment connecting (235, 125) to (511, 92).
; PLAN: r0=235(x1), r1=125(y1), r2=511(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 125
LDI r2, 511
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
