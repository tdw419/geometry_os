; DESCRIPTION: Places a red line segment connecting (504, 72) to (111, 246).
; PLAN: r0=504(x1), r1=72(y1), r2=111(x2), r3=246(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 72
LDI r2, 111
LDI r3, 246
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
