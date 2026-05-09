; DESCRIPTION: Draws a white line from (315, 189) to (470, 248).
; PLAN: r0=315(x1), r1=189(y1), r2=470(x2), r3=248(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 189
LDI r2, 470
LDI r3, 248
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
