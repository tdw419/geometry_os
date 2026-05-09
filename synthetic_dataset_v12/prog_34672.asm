; DESCRIPTION: Renders a white line between points (15, 248) and (185, 46).
; PLAN: r0=15(x1), r1=248(y1), r2=185(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 248
LDI r2, 185
LDI r3, 46
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
