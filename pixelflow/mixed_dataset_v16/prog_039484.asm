; DESCRIPTION: Renders a white line between points (319, 81) and (30, 190).
; PLAN: r0=319(x1), r1=81(y1), r2=30(x2), r3=190(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 81
LDI r2, 30
LDI r3, 190
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
