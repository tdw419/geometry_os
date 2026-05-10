; DESCRIPTION: Places a red line segment connecting (193, 109) to (272, 82).
; PLAN: r0=193(x1), r1=109(y1), r2=272(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 109
LDI r2, 272
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
