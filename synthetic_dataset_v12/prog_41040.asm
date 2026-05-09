; DESCRIPTION: Places a red line segment connecting (181, 189) to (263, 76).
; PLAN: r0=181(x1), r1=189(y1), r2=263(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 189
LDI r2, 263
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
