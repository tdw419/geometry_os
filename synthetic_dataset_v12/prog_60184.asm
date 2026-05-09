; DESCRIPTION: Renders a yellow line between points (187, 91) and (67, 78).
; PLAN: r0=187(x1), r1=91(y1), r2=67(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 91
LDI r2, 67
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
