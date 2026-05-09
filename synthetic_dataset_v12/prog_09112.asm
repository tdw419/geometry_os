; DESCRIPTION: Places a red line segment connecting (263, 229) to (157, 58).
; PLAN: r0=263(x1), r1=229(y1), r2=157(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 229
LDI r2, 157
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
