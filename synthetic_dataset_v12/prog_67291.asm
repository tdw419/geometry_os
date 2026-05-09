; DESCRIPTION: Draws a white line from (432, 233) to (270, 126).
; PLAN: r0=432(x1), r1=233(y1), r2=270(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 233
LDI r2, 270
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
