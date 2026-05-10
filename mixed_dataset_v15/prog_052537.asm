; DESCRIPTION: Renders a white line between points (45, 71) and (226, 190).
; PLAN: r0=45(x1), r1=71(y1), r2=226(x2), r3=190(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 71
LDI r2, 226
LDI r3, 190
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
