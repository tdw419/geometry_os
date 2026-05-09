; DESCRIPTION: Places a red line segment connecting (105, 108) to (235, 57).
; PLAN: r0=105(x1), r1=108(y1), r2=235(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 108
LDI r2, 235
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
