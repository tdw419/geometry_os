; DESCRIPTION: Draws a black line from (191, 154) to (186, 47).
; PLAN: r0=191(x1), r1=154(y1), r2=186(x2), r3=47(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 154
LDI r2, 186
LDI r3, 47
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
