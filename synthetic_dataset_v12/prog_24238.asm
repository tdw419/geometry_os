; DESCRIPTION: Renders a white line between points (27, 71) and (458, 237).
; PLAN: r0=27(x1), r1=71(y1), r2=458(x2), r3=237(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 71
LDI r2, 458
LDI r3, 237
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
