; DESCRIPTION: Renders a red line between points (433, 215) and (252, 143).
; PLAN: r0=433(x1), r1=215(y1), r2=252(x2), r3=143(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 215
LDI r2, 252
LDI r3, 143
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
