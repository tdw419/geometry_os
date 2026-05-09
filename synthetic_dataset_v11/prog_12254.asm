; DESCRIPTION: Renders a green line between points (26, 15) and (238, 55).
; PLAN: r0=26(x1), r1=15(y1), r2=238(x2), r3=55(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 15
LDI r2, 238
LDI r3, 55
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
