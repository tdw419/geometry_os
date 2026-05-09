; DESCRIPTION: Renders a yellow line between points (332, 67) and (150, 102).
; PLAN: r0=332(x1), r1=67(y1), r2=150(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 67
LDI r2, 150
LDI r3, 102
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
