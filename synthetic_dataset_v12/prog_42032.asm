; DESCRIPTION: Renders a green line between points (56, 12) and (273, 71).
; PLAN: r0=56(x1), r1=12(y1), r2=273(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 12
LDI r2, 273
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
