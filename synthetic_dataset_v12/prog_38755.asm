; DESCRIPTION: Renders a green line between points (174, 190) and (498, 19).
; PLAN: r0=174(x1), r1=190(y1), r2=498(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 190
LDI r2, 498
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
