; DESCRIPTION: Draws a white line from (204, 186) to (408, 90).
; PLAN: r0=204(x1), r1=186(y1), r2=408(x2), r3=90(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 186
LDI r2, 408
LDI r3, 90
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
