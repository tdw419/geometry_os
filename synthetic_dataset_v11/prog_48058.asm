; DESCRIPTION: Renders a green line between points (90, 199) and (92, 75).
; PLAN: r0=90(x1), r1=199(y1), r2=92(x2), r3=75(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 199
LDI r2, 92
LDI r3, 75
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
