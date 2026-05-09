; DESCRIPTION: Renders a black line between points (21, 131) and (159, 146).
; PLAN: r0=21(x1), r1=131(y1), r2=159(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 131
LDI r2, 159
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
