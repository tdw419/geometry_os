; DESCRIPTION: Renders a yellow line between points (268, 234) and (6, 121).
; PLAN: r0=268(x1), r1=234(y1), r2=6(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 234
LDI r2, 6
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
