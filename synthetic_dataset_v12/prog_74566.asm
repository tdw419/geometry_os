; DESCRIPTION: Renders a red line between points (433, 147) and (401, 233).
; PLAN: r0=433(x1), r1=147(y1), r2=401(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 147
LDI r2, 401
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
