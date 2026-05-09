; DESCRIPTION: Draws a white line from (395, 177) to (305, 99).
; PLAN: r0=395(x1), r1=177(y1), r2=305(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 177
LDI r2, 305
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
