; DESCRIPTION: Renders a green line between points (245, 36) and (249, 149).
; PLAN: r0=245(x1), r1=36(y1), r2=249(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 36
LDI r2, 249
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
