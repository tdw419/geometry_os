; DESCRIPTION: Draws a green line from (227, 166) to (214, 1).
; PLAN: r0=227(x1), r1=166(y1), r2=214(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 166
LDI r2, 214
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
