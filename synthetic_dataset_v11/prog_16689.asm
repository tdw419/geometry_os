; DESCRIPTION: Renders a white line between points (74, 190) and (63, 101).
; PLAN: r0=74(x1), r1=190(y1), r2=63(x2), r3=101(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 190
LDI r2, 63
LDI r3, 101
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
