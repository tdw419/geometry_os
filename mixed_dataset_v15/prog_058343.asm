; DESCRIPTION: Draws a white line from (394, 84) to (147, 83).
; PLAN: r0=394(x1), r1=84(y1), r2=147(x2), r3=83(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 84
LDI r2, 147
LDI r3, 83
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
