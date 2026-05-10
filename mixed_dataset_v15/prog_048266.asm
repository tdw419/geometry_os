; DESCRIPTION: Renders a green line between points (5, 82) and (353, 48).
; PLAN: r0=5(x1), r1=82(y1), r2=353(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 82
LDI r2, 353
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
