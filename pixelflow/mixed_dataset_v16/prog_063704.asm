; DESCRIPTION: Draws a white line from (147, 30) to (253, 86).
; PLAN: r0=147(x1), r1=30(y1), r2=253(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 30
LDI r2, 253
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
