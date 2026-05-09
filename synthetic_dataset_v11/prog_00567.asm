; DESCRIPTION: Draws a white line from (196, 189) to (14, 137).
; PLAN: r0=196(x1), r1=189(y1), r2=14(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 189
LDI r2, 14
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
