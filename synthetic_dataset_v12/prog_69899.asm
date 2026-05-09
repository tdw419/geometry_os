; DESCRIPTION: Places a red line segment connecting (37, 240) to (441, 178).
; PLAN: r0=37(x1), r1=240(y1), r2=441(x2), r3=178(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 240
LDI r2, 441
LDI r3, 178
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
