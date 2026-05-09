; DESCRIPTION: Places a red line segment connecting (346, 99) to (426, 247).
; PLAN: r0=346(x1), r1=99(y1), r2=426(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 99
LDI r2, 426
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
