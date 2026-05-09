; DESCRIPTION: Places a red line segment connecting (107, 178) to (436, 76).
; PLAN: r0=107(x1), r1=178(y1), r2=436(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 178
LDI r2, 436
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
