; DESCRIPTION: Renders a white line between points (177, 189) and (353, 193).
; PLAN: r0=177(x1), r1=189(y1), r2=353(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 189
LDI r2, 353
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
