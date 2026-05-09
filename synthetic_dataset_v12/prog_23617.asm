; DESCRIPTION: Places a red line segment connecting (389, 181) to (289, 42).
; PLAN: r0=389(x1), r1=181(y1), r2=289(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 181
LDI r2, 289
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
