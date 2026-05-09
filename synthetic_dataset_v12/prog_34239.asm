; DESCRIPTION: Draws a yellow line from (372, 95) to (6, 187).
; PLAN: r0=372(x1), r1=95(y1), r2=6(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 95
LDI r2, 6
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
