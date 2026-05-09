; DESCRIPTION: Places a red line segment connecting (235, 16) to (208, 33).
; PLAN: r0=235(x1), r1=16(y1), r2=208(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 16
LDI r2, 208
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
