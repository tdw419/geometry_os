; DESCRIPTION: Renders a green line between points (211, 193) and (61, 101).
; PLAN: r0=211(x1), r1=193(y1), r2=61(x2), r3=101(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 193
LDI r2, 61
LDI r3, 101
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
