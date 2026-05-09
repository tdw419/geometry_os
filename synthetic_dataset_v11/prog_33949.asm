; DESCRIPTION: Draws a yellow line from (150, 30) to (170, 187).
; PLAN: r0=150(x1), r1=30(y1), r2=170(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 30
LDI r2, 170
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
