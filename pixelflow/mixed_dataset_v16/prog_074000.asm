; DESCRIPTION: Renders a green line between points (182, 40) and (191, 109).
; PLAN: r0=182(x1), r1=40(y1), r2=191(x2), r3=109(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 40
LDI r2, 191
LDI r3, 109
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
