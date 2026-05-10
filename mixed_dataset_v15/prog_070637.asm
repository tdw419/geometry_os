; DESCRIPTION: Draws a green line from (188, 82) to (297, 66).
; PLAN: r0=188(x1), r1=82(y1), r2=297(x2), r3=66(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 82
LDI r2, 297
LDI r3, 66
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
