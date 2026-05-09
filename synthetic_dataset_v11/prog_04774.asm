; DESCRIPTION: Renders a green line between points (238, 4) and (148, 209).
; PLAN: r0=238(x1), r1=4(y1), r2=148(x2), r3=209(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 4
LDI r2, 148
LDI r3, 209
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
