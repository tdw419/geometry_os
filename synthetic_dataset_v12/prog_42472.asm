; DESCRIPTION: Renders a red line between points (256, 109) and (87, 120).
; PLAN: r0=256(x1), r1=109(y1), r2=87(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 109
LDI r2, 87
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
