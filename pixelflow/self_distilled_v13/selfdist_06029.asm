; DESCRIPTION: Draws a yellow line from (119, 164) to (160, 138).
; PLAN: r0=119(x1), r1=164(y1), r2=160(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 164
LDI r2, 160
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
