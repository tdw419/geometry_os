; DESCRIPTION: Renders a red line between points (5, 249) and (3, 67).
; PLAN: r0=5(x1), r1=249(y1), r2=3(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 249
LDI r2, 3
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
