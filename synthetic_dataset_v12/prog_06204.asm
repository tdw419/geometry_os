; DESCRIPTION: Draws a green line from (435, 31) to (266, 138).
; PLAN: r0=435(x1), r1=31(y1), r2=266(x2), r3=138(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 31
LDI r2, 266
LDI r3, 138
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
