; DESCRIPTION: Draws a white line from (71, 192) to (110, 14).
; PLAN: r0=71(x1), r1=192(y1), r2=110(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 192
LDI r2, 110
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
