; DESCRIPTION: Draws a green line from (283, 214) to (421, 217).
; PLAN: r0=283(x1), r1=214(y1), r2=421(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 214
LDI r2, 421
LDI r3, 217
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
