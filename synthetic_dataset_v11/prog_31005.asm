; DESCRIPTION: Renders a green line between points (83, 120) and (191, 193).
; PLAN: r0=83(x1), r1=120(y1), r2=191(x2), r3=193(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 120
LDI r2, 191
LDI r3, 193
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
