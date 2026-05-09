; DESCRIPTION: Draws a white line from (204, 208) to (143, 126).
; PLAN: r0=204(x1), r1=208(y1), r2=143(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 208
LDI r2, 143
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
