; DESCRIPTION: Draws a white line from (85, 73) to (195, 9).
; PLAN: r0=85(x1), r1=73(y1), r2=195(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 73
LDI r2, 195
LDI r3, 9
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
