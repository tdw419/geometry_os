; DESCRIPTION: Renders a white line between points (294, 199) and (112, 197).
; PLAN: r0=294(x1), r1=199(y1), r2=112(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 199
LDI r2, 112
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
