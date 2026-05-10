; DESCRIPTION: Draws a yellow line from (113, 212) to (234, 43).
; PLAN: r0=113(x1), r1=212(y1), r2=234(x2), r3=43(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 212
LDI r2, 234
LDI r3, 43
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
