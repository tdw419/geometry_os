; DESCRIPTION: Draws a yellow line from (304, 68) to (229, 130).
; PLAN: r0=304(x1), r1=68(y1), r2=229(x2), r3=130(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 68
LDI r2, 229
LDI r3, 130
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
