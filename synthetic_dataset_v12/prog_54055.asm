; DESCRIPTION: Renders a white line between points (247, 255) and (478, 197).
; PLAN: r0=247(x1), r1=255(y1), r2=478(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 255
LDI r2, 478
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
