; DESCRIPTION: Renders a red line between points (422, 145) and (42, 164).
; PLAN: r0=422(x1), r1=145(y1), r2=42(x2), r3=164(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 145
LDI r2, 42
LDI r3, 164
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
