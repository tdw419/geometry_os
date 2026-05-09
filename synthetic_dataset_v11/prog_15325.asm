; DESCRIPTION: Draws a white line from (211, 37) to (158, 173).
; PLAN: r0=211(x1), r1=37(y1), r2=158(x2), r3=173(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 37
LDI r2, 158
LDI r3, 173
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
