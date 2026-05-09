; DESCRIPTION: Draws a green line from (166, 182) to (191, 54).
; PLAN: r0=166(x1), r1=182(y1), r2=191(x2), r3=54(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 182
LDI r2, 191
LDI r3, 54
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
