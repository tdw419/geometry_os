; DESCRIPTION: Renders a cyan line between points (418, 14) and (478, 96).
; PLAN: r0=418(x1), r1=14(y1), r2=478(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 14
LDI r2, 478
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
