; DESCRIPTION: Places a red line segment connecting (408, 27) to (101, 241).
; PLAN: r0=408(x1), r1=27(y1), r2=101(x2), r3=241(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 27
LDI r2, 101
LDI r3, 241
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
