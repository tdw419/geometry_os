; DESCRIPTION: Draws a white line from (80, 183) to (205, 126).
; PLAN: r0=80(x1), r1=183(y1), r2=205(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 183
LDI r2, 205
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
