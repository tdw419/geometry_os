; DESCRIPTION: Places a red line segment connecting (466, 43) to (440, 143).
; PLAN: r0=466(x1), r1=43(y1), r2=440(x2), r3=143(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 43
LDI r2, 440
LDI r3, 143
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
