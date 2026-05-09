; DESCRIPTION: Draws a yellow line from (117, 223) to (132, 239).
; PLAN: r0=117(x1), r1=223(y1), r2=132(x2), r3=239(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 223
LDI r2, 132
LDI r3, 239
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
