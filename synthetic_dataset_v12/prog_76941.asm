; DESCRIPTION: Draws a yellow line from (388, 27) to (222, 241).
; PLAN: r0=388(x1), r1=27(y1), r2=222(x2), r3=241(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 27
LDI r2, 222
LDI r3, 241
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
