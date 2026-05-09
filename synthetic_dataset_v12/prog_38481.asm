; DESCRIPTION: Draws a yellow line from (309, 114) to (5, 208).
; PLAN: r0=309(x1), r1=114(y1), r2=5(x2), r3=208(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 114
LDI r2, 5
LDI r3, 208
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
