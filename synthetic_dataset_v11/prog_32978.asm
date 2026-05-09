; DESCRIPTION: Draws a white line from (183, 20) to (211, 64).
; PLAN: r0=183(x1), r1=20(y1), r2=211(x2), r3=64(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 20
LDI r2, 211
LDI r3, 64
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
