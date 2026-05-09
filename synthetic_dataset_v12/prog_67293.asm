; DESCRIPTION: Draws a green line from (391, 137) to (269, 46).
; PLAN: r0=391(x1), r1=137(y1), r2=269(x2), r3=46(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 137
LDI r2, 269
LDI r3, 46
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
