; DESCRIPTION: Draws a yellow line from (173, 43) to (35, 234).
; PLAN: r0=173(x1), r1=43(y1), r2=35(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 43
LDI r2, 35
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
