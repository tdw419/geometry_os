; DESCRIPTION: Draws a yellow line from (171, 167) to (293, 97).
; PLAN: r0=171(x1), r1=167(y1), r2=293(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 167
LDI r2, 293
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
