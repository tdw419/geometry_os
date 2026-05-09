; DESCRIPTION: Renders a green line between points (120, 193) and (249, 34).
; PLAN: r0=120(x1), r1=193(y1), r2=249(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 193
LDI r2, 249
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
