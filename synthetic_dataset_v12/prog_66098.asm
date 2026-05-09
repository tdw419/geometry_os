; DESCRIPTION: Draws a white line from (141, 31) to (0, 65).
; PLAN: r0=141(x1), r1=31(y1), r2=0(x2), r3=65(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 31
LDI r2, 0
LDI r3, 65
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
