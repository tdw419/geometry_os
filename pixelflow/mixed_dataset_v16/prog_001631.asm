; DESCRIPTION: Draws a yellow line from (24, 243) to (454, 138).
; PLAN: r0=24(x1), r1=243(y1), r2=454(x2), r3=138(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 243
LDI r2, 454
LDI r3, 138
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
