; DESCRIPTION: Places a red line segment connecting (120, 236) to (130, 31).
; PLAN: r0=120(x1), r1=236(y1), r2=130(x2), r3=31(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 236
LDI r2, 130
LDI r3, 31
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
