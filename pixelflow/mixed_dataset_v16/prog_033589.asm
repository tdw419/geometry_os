; DESCRIPTION: Draws a white line from (147, 46) to (509, 231).
; PLAN: r0=147(x1), r1=46(y1), r2=509(x2), r3=231(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 46
LDI r2, 509
LDI r3, 231
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
