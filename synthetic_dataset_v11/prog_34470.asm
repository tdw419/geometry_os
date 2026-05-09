; DESCRIPTION: Renders a green line between points (112, 243) and (98, 57).
; PLAN: r0=112(x1), r1=243(y1), r2=98(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 243
LDI r2, 98
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
