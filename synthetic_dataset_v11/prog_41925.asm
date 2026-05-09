; DESCRIPTION: Draws a yellow line from (27, 71) to (236, 1).
; PLAN: r0=27(x1), r1=71(y1), r2=236(x2), r3=1(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 71
LDI r2, 236
LDI r3, 1
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
