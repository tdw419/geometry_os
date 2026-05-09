; DESCRIPTION: Draws a yellow line from (391, 205) to (44, 208).
; PLAN: r0=391(x1), r1=205(y1), r2=44(x2), r3=208(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 205
LDI r2, 44
LDI r3, 208
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
