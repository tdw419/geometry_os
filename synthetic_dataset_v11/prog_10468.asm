; DESCRIPTION: Renders a green line between points (39, 11) and (148, 255).
; PLAN: r0=39(x1), r1=11(y1), r2=148(x2), r3=255(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 11
LDI r2, 148
LDI r3, 255
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
