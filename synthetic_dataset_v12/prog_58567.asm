; DESCRIPTION: Places a red line segment connecting (57, 47) to (498, 206).
; PLAN: r0=57(x1), r1=47(y1), r2=498(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 47
LDI r2, 498
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
