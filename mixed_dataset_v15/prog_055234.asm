; DESCRIPTION: Places a red line segment connecting (383, 107) to (189, 29).
; PLAN: r0=383(x1), r1=107(y1), r2=189(x2), r3=29(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 107
LDI r2, 189
LDI r3, 29
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
