; DESCRIPTION: Renders a green line between points (265, 171) and (238, 119).
; PLAN: r0=265(x1), r1=171(y1), r2=238(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 171
LDI r2, 238
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
