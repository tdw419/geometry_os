; DESCRIPTION: Renders a red line between points (433, 94) and (98, 171).
; PLAN: r0=433(x1), r1=94(y1), r2=98(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 94
LDI r2, 98
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
