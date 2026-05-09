; DESCRIPTION: Renders a red line between points (157, 64) and (398, 201).
; PLAN: r0=157(x1), r1=64(y1), r2=398(x2), r3=201(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 64
LDI r2, 398
LDI r3, 201
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
