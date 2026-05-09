; DESCRIPTION: Places a red line segment connecting (135, 65) to (461, 204).
; PLAN: r0=135(x1), r1=65(y1), r2=461(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 65
LDI r2, 461
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
