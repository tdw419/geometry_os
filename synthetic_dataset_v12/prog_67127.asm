; DESCRIPTION: Renders a green line between points (353, 154) and (204, 1).
; PLAN: r0=353(x1), r1=154(y1), r2=204(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 154
LDI r2, 204
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
