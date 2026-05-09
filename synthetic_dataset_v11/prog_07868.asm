; DESCRIPTION: Renders a green line between points (238, 194) and (168, 91).
; PLAN: r0=238(x1), r1=194(y1), r2=168(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 194
LDI r2, 168
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
