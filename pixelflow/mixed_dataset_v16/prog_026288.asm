; DESCRIPTION: Draws a yellow line from (9, 46) to (176, 194).
; PLAN: r0=9(x1), r1=46(y1), r2=176(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 46
LDI r2, 176
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
