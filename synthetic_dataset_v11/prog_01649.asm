; DESCRIPTION: Renders a cyan line between points (248, 204) and (18, 141).
; PLAN: r0=248(x1), r1=204(y1), r2=18(x2), r3=141(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 204
LDI r2, 18
LDI r3, 141
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
