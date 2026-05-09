; DESCRIPTION: Renders a green line between points (146, 171) and (159, 163).
; PLAN: r0=146(x1), r1=171(y1), r2=159(x2), r3=163(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 171
LDI r2, 159
LDI r3, 163
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
