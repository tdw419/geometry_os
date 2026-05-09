; DESCRIPTION: Draws a white line from (309, 112) to (45, 21).
; PLAN: r0=309(x1), r1=112(y1), r2=45(x2), r3=21(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 112
LDI r2, 45
LDI r3, 21
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
