; DESCRIPTION: Draws a white line from (394, 217) to (473, 85).
; PLAN: r0=394(x1), r1=217(y1), r2=473(x2), r3=85(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 217
LDI r2, 473
LDI r3, 85
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
