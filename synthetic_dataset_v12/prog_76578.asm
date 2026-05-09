; DESCRIPTION: Renders a red line between points (170, 111) and (331, 61).
; PLAN: r0=170(x1), r1=111(y1), r2=331(x2), r3=61(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 111
LDI r2, 331
LDI r3, 61
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
