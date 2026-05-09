; DESCRIPTION: Draws a white line from (361, 208) to (269, 205).
; PLAN: r0=361(x1), r1=208(y1), r2=269(x2), r3=205(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 208
LDI r2, 269
LDI r3, 205
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
