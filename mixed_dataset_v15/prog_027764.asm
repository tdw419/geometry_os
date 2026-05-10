; DESCRIPTION: Renders a red line segment connecting (67, 109) to (225, 11).
; PLAN: r0=67(x1), r1=109(y1), r2=225(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 109
LDI r2, 225
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
