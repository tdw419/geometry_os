; DESCRIPTION: Draws a green line from (297, 174) to (157, 197).
; PLAN: r0=297(x1), r1=174(y1), r2=157(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 174
LDI r2, 157
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
