; DESCRIPTION: Draws a yellow line from (11, 98) to (367, 181).
; PLAN: r0=11(x1), r1=98(y1), r2=367(x2), r3=181(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 98
LDI r2, 367
LDI r3, 181
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
