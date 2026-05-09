; DESCRIPTION: Places a red line segment connecting (213, 78) to (143, 199).
; PLAN: r0=213(x1), r1=78(y1), r2=143(x2), r3=199(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 78
LDI r2, 143
LDI r3, 199
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
