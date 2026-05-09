; DESCRIPTION: Draws a cyan line from (2, 201) to (116, 211).
; PLAN: r0=2(x1), r1=201(y1), r2=116(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 201
LDI r2, 116
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
