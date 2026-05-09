; DESCRIPTION: Draws a yellow line from (23, 125) to (252, 71).
; PLAN: r0=23(x1), r1=125(y1), r2=252(x2), r3=71(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 125
LDI r2, 252
LDI r3, 71
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
