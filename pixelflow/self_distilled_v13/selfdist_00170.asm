; DESCRIPTION: Renders a red line segment connecting (383, 107) to (114, 148).
; PLAN: r0=383(x1), r1=107(y1), r2=114(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 107
LDI r2, 114
LDI r3, 148
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
