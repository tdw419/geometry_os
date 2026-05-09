; DESCRIPTION: Draws a yellow line from (166, 222) to (198, 165).
; PLAN: r0=166(x1), r1=222(y1), r2=198(x2), r3=165(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 222
LDI r2, 198
LDI r3, 165
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
