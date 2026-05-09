; DESCRIPTION: Renders a green line between points (411, 138) and (438, 38).
; PLAN: r0=411(x1), r1=138(y1), r2=438(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 138
LDI r2, 438
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
