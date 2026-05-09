; DESCRIPTION: Renders a green line between points (98, 76) and (60, 124).
; PLAN: r0=98(x1), r1=76(y1), r2=60(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 76
LDI r2, 60
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
