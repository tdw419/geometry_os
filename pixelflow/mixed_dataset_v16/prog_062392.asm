; DESCRIPTION: Draws a yellow line from (48, 160) to (452, 214).
; PLAN: r0=48(x1), r1=160(y1), r2=452(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 160
LDI r2, 452
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
