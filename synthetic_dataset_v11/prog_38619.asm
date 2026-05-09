; DESCRIPTION: Renders a green line between points (148, 94) and (197, 91).
; PLAN: r0=148(x1), r1=94(y1), r2=197(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 94
LDI r2, 197
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
