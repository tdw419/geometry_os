; DESCRIPTION: Renders a yellow line between points (170, 67) and (189, 40).
; PLAN: r0=170(x1), r1=67(y1), r2=189(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 67
LDI r2, 189
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
