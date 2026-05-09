; DESCRIPTION: Renders a red line between points (104, 248) and (394, 94).
; PLAN: r0=104(x1), r1=248(y1), r2=394(x2), r3=94(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 248
LDI r2, 394
LDI r3, 94
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
