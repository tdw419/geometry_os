; DESCRIPTION: Draws a white line from (195, 172) to (297, 79).
; PLAN: r0=195(x1), r1=172(y1), r2=297(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 172
LDI r2, 297
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
