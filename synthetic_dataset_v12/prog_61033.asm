; DESCRIPTION: Renders a yellow line between points (246, 70) and (67, 87).
; PLAN: r0=246(x1), r1=70(y1), r2=67(x2), r3=87(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 70
LDI r2, 67
LDI r3, 87
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
