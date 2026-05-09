; DESCRIPTION: Renders a green line between points (438, 26) and (193, 131).
; PLAN: r0=438(x1), r1=26(y1), r2=193(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 26
LDI r2, 193
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
