; DESCRIPTION: Draws a green line from (417, 8) to (341, 229).
; PLAN: r0=417(x1), r1=8(y1), r2=341(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 8
LDI r2, 341
LDI r3, 229
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
