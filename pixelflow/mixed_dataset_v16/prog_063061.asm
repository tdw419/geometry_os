; DESCRIPTION: Draws a white line from (417, 201) to (364, 103).
; PLAN: r0=417(x1), r1=201(y1), r2=364(x2), r3=103(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 201
LDI r2, 364
LDI r3, 103
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
