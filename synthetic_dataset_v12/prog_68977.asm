; DESCRIPTION: Draws a yellow line from (245, 176) to (112, 186).
; PLAN: r0=245(x1), r1=176(y1), r2=112(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 176
LDI r2, 112
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
