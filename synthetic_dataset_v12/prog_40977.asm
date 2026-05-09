; DESCRIPTION: Draws a green line from (425, 218) to (316, 188).
; PLAN: r0=425(x1), r1=218(y1), r2=316(x2), r3=188(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 218
LDI r2, 316
LDI r3, 188
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
