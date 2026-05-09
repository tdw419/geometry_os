; DESCRIPTION: Draws a yellow line from (18, 100) to (214, 19).
; PLAN: r0=18(x1), r1=100(y1), r2=214(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 100
LDI r2, 214
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
