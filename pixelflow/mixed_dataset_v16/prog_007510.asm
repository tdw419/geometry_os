; DESCRIPTION: Renders a green line segment connecting (249, 67) to (208, 112).
; PLAN: r0=249(x1), r1=67(y1), r2=208(x2), r3=112(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 67
LDI r2, 208
LDI r3, 112
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
