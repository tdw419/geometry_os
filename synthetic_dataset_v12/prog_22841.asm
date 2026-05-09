; DESCRIPTION: Places a red line segment connecting (193, 56) to (336, 14).
; PLAN: r0=193(x1), r1=56(y1), r2=336(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 56
LDI r2, 336
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
