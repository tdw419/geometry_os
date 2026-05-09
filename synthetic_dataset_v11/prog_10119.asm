; DESCRIPTION: Renders a red line between points (107, 93) and (190, 37).
; PLAN: r0=107(x1), r1=93(y1), r2=190(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 93
LDI r2, 190
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
