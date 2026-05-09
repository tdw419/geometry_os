; DESCRIPTION: Renders a green line between points (145, 242) and (58, 137).
; PLAN: r0=145(x1), r1=242(y1), r2=58(x2), r3=137(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 242
LDI r2, 58
LDI r3, 137
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
