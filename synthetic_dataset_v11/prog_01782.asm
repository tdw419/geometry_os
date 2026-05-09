; DESCRIPTION: Renders a blue line between points (238, 151) and (245, 65).
; PLAN: r0=238(x1), r1=151(y1), r2=245(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 151
LDI r2, 245
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
