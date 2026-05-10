; DESCRIPTION: Renders a white line between points (425, 237) and (478, 171).
; PLAN: r0=425(x1), r1=237(y1), r2=478(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 237
LDI r2, 478
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
