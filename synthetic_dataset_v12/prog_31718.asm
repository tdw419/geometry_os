; DESCRIPTION: Draws a yellow line from (53, 225) to (64, 35).
; PLAN: r0=53(x1), r1=225(y1), r2=64(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 225
LDI r2, 64
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
