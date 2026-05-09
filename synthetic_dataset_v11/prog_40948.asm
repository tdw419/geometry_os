; DESCRIPTION: Draws a yellow line from (234, 62) to (17, 177).
; PLAN: r0=234(x1), r1=62(y1), r2=17(x2), r3=177(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 62
LDI r2, 17
LDI r3, 177
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
