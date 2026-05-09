; DESCRIPTION: Renders a red line between points (37, 67) and (213, 185).
; PLAN: r0=37(x1), r1=67(y1), r2=213(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 67
LDI r2, 213
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
