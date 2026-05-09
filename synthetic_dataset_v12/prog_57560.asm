; DESCRIPTION: Draws a yellow line from (32, 41) to (452, 196).
; PLAN: r0=32(x1), r1=41(y1), r2=452(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 41
LDI r2, 452
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
