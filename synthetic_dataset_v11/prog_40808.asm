; DESCRIPTION: Draws a white line from (11, 56) to (120, 6).
; PLAN: r0=11(x1), r1=56(y1), r2=120(x2), r3=6(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 56
LDI r2, 120
LDI r3, 6
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
