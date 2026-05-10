; DESCRIPTION: Draws a yellow line from (240, 241) to (234, 84).
; PLAN: r0=240(x1), r1=241(y1), r2=234(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 241
LDI r2, 234
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
