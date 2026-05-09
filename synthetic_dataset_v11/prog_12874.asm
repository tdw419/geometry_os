; DESCRIPTION: Renders a green line between points (215, 190) and (183, 124).
; PLAN: r0=215(x1), r1=190(y1), r2=183(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 190
LDI r2, 183
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
