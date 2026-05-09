; DESCRIPTION: Draws a white line from (38, 14) to (6, 39).
; PLAN: r0=38(x1), r1=14(y1), r2=6(x2), r3=39(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 14
LDI r2, 6
LDI r3, 39
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
