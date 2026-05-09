; DESCRIPTION: Draws a white line from (122, 35) to (19, 40).
; PLAN: r0=122(x1), r1=35(y1), r2=19(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 35
LDI r2, 19
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
