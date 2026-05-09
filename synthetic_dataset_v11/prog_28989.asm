; DESCRIPTION: Draws a white line from (251, 253) to (107, 155).
; PLAN: r0=251(x1), r1=253(y1), r2=107(x2), r3=155(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 253
LDI r2, 107
LDI r3, 155
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
