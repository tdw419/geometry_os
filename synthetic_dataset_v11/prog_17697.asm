; DESCRIPTION: Draws a yellow line from (0, 226) to (120, 99).
; PLAN: r0=0(x1), r1=226(y1), r2=120(x2), r3=99(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 226
LDI r2, 120
LDI r3, 99
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
