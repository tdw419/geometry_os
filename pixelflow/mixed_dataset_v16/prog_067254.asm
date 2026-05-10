; DESCRIPTION: Draws a yellow line from (261, 237) to (234, 92).
; PLAN: r0=261(x1), r1=237(y1), r2=234(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 237
LDI r2, 234
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
