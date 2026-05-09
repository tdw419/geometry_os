; DESCRIPTION: Renders a green line between points (411, 106) and (10, 146).
; PLAN: r0=411(x1), r1=106(y1), r2=10(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 106
LDI r2, 10
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
