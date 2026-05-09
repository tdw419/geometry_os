; DESCRIPTION: Renders a green line between points (181, 26) and (92, 36).
; PLAN: r0=181(x1), r1=26(y1), r2=92(x2), r3=36(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 26
LDI r2, 92
LDI r3, 36
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
