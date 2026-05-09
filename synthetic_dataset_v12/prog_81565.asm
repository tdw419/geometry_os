; DESCRIPTION: Renders a white line between points (349, 63) and (177, 190).
; PLAN: r0=349(x1), r1=63(y1), r2=177(x2), r3=190(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 63
LDI r2, 177
LDI r3, 190
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
