; DESCRIPTION: Renders a green line between points (115, 112) and (120, 0).
; PLAN: r0=115(x1), r1=112(y1), r2=120(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 112
LDI r2, 120
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
