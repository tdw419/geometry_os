; DESCRIPTION: Renders a yellow line segment connecting (353, 53) to (167, 82).
; PLAN: r0=353(x1), r1=53(y1), r2=167(x2), r3=82(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 53
LDI r2, 167
LDI r3, 82
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
