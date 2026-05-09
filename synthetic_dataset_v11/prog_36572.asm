; DESCRIPTION: Draws a yellow line from (203, 120) to (234, 98).
; PLAN: r0=203(x1), r1=120(y1), r2=234(x2), r3=98(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 120
LDI r2, 234
LDI r3, 98
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
