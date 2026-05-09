; DESCRIPTION: Draws a yellow line from (222, 196) to (248, 186).
; PLAN: r0=222(x1), r1=196(y1), r2=248(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 196
LDI r2, 248
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
