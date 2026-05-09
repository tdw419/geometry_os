; DESCRIPTION: Renders a cyan line between points (478, 58) and (71, 214).
; PLAN: r0=478(x1), r1=58(y1), r2=71(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 58
LDI r2, 71
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
