; DESCRIPTION: Draws a yellow line from (165, 214) to (108, 23).
; PLAN: r0=165(x1), r1=214(y1), r2=108(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 214
LDI r2, 108
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
