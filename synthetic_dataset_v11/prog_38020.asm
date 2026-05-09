; DESCRIPTION: Renders a yellow line between points (83, 240) and (148, 236).
; PLAN: r0=83(x1), r1=240(y1), r2=148(x2), r3=236(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 240
LDI r2, 148
LDI r3, 236
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
