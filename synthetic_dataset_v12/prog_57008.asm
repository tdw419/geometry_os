; DESCRIPTION: Renders a green line between points (122, 2) and (102, 67).
; PLAN: r0=122(x1), r1=2(y1), r2=102(x2), r3=67(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 2
LDI r2, 102
LDI r3, 67
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
