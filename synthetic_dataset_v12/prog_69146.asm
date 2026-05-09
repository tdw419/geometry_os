; DESCRIPTION: Draws a white line from (472, 0) to (87, 4).
; PLAN: r0=472(x1), r1=0(y1), r2=87(x2), r3=4(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 0
LDI r2, 87
LDI r3, 4
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
