; DESCRIPTION: Renders a purple line between points (98, 242) and (66, 57).
; PLAN: r0=98(x1), r1=242(y1), r2=66(x2), r3=57(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 242
LDI r2, 66
LDI r3, 57
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
