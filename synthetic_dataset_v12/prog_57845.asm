; DESCRIPTION: Renders a green line between points (225, 185) and (300, 134).
; PLAN: r0=225(x1), r1=185(y1), r2=300(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 185
LDI r2, 300
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
