; DESCRIPTION: Renders a green line between points (509, 236) and (148, 17).
; PLAN: r0=509(x1), r1=236(y1), r2=148(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 236
LDI r2, 148
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
