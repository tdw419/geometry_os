; DESCRIPTION: Places a red line segment connecting (309, 107) to (230, 40).
; PLAN: r0=309(x1), r1=107(y1), r2=230(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 107
LDI r2, 230
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
