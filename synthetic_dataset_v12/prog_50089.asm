; DESCRIPTION: Places a red line segment connecting (3, 167) to (354, 98).
; PLAN: r0=3(x1), r1=167(y1), r2=354(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 167
LDI r2, 354
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
