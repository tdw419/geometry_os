; DESCRIPTION: Places a red line segment connecting (79, 62) to (143, 197).
; PLAN: r0=79(x1), r1=62(y1), r2=143(x2), r3=197(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 62
LDI r2, 143
LDI r3, 197
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
