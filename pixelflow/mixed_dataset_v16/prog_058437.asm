; DESCRIPTION: Draws a green line from (297, 98) to (236, 179).
; PLAN: r0=297(x1), r1=98(y1), r2=236(x2), r3=179(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 98
LDI r2, 236
LDI r3, 179
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
