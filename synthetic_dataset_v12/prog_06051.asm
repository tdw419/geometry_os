; DESCRIPTION: Renders a red line between points (378, 67) and (453, 163).
; PLAN: r0=378(x1), r1=67(y1), r2=453(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 67
LDI r2, 453
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
