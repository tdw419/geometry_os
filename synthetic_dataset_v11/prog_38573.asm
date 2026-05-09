; DESCRIPTION: Renders a red line between points (138, 14) and (67, 222).
; PLAN: r0=138(x1), r1=14(y1), r2=67(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 14
LDI r2, 67
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
