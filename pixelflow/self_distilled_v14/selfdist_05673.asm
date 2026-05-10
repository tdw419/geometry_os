; DESCRIPTION: Renders a yellow line segment connecting (72, 36) to (252, 134).
; PLAN: r0=72(x1), r1=36(y1), r2=252(x2), r3=134(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 36
LDI r2, 252
LDI r3, 134
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
