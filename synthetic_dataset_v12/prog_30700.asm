; DESCRIPTION: Draws a green line from (147, 152) to (68, 103).
; PLAN: r0=147(x1), r1=152(y1), r2=68(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 152
LDI r2, 68
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
