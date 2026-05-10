; DESCRIPTION: Draws a green line from (297, 151) to (164, 66).
; PLAN: r0=297(x1), r1=151(y1), r2=164(x2), r3=66(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 151
LDI r2, 164
LDI r3, 66
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
