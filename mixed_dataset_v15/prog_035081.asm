; DESCRIPTION: Draws a yellow line from (227, 112) to (418, 42).
; PLAN: r0=227(x1), r1=112(y1), r2=418(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 112
LDI r2, 418
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
