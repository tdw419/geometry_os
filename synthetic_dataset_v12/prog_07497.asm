; DESCRIPTION: Places a red line segment connecting (111, 12) to (118, 253).
; PLAN: r0=111(x1), r1=12(y1), r2=118(x2), r3=253(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 12
LDI r2, 118
LDI r3, 253
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
