; DESCRIPTION: Renders a yellow line between points (59, 195) and (297, 66).
; PLAN: r0=59(x1), r1=195(y1), r2=297(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 195
LDI r2, 297
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
