; DESCRIPTION: Draws a yellow line from (254, 3) to (31, 226).
; PLAN: r0=254(x1), r1=3(y1), r2=31(x2), r3=226(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 3
LDI r2, 31
LDI r3, 226
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
