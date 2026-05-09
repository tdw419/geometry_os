; DESCRIPTION: Draws a white line from (120, 52) to (195, 20).
; PLAN: r0=120(x1), r1=52(y1), r2=195(x2), r3=20(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 52
LDI r2, 195
LDI r3, 20
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
