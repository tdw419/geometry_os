; DESCRIPTION: Renders a cyan line between points (414, 71) and (418, 136).
; PLAN: r0=414(x1), r1=71(y1), r2=418(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 71
LDI r2, 418
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
