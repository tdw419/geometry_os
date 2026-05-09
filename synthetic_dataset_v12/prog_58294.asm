; DESCRIPTION: Renders a black line between points (439, 204) and (467, 186).
; PLAN: r0=439(x1), r1=204(y1), r2=467(x2), r3=186(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 204
LDI r2, 467
LDI r3, 186
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
