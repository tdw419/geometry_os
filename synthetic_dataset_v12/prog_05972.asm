; DESCRIPTION: Renders a green line between points (190, 82) and (491, 197).
; PLAN: r0=190(x1), r1=82(y1), r2=491(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 82
LDI r2, 491
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
