; DESCRIPTION: Renders a yellow line between points (1, 234) and (356, 11).
; PLAN: r0=1(x1), r1=234(y1), r2=356(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 234
LDI r2, 356
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
