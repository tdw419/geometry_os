; DESCRIPTION: Renders a cyan line between points (226, 182) and (308, 225).
; PLAN: r0=226(x1), r1=182(y1), r2=308(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 182
LDI r2, 308
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
