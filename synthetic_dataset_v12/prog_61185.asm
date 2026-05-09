; DESCRIPTION: Draws a black line from (288, 124) to (466, 21).
; PLAN: r0=288(x1), r1=124(y1), r2=466(x2), r3=21(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 124
LDI r2, 466
LDI r3, 21
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
