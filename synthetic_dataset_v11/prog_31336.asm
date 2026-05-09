; DESCRIPTION: Renders a green line between points (57, 98) and (185, 24).
; PLAN: r0=57(x1), r1=98(y1), r2=185(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 98
LDI r2, 185
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
