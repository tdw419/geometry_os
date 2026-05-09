; DESCRIPTION: Draws a black line from (414, 32) to (186, 188).
; PLAN: r0=414(x1), r1=32(y1), r2=186(x2), r3=188(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 32
LDI r2, 186
LDI r3, 188
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
