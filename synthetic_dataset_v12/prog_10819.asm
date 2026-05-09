; DESCRIPTION: Renders a cyan line between points (150, 227) and (186, 82).
; PLAN: r0=150(x1), r1=227(y1), r2=186(x2), r3=82(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 227
LDI r2, 186
LDI r3, 82
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
