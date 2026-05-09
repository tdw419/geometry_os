; DESCRIPTION: Places a red line segment connecting (191, 197) to (286, 130).
; PLAN: r0=191(x1), r1=197(y1), r2=286(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 197
LDI r2, 286
LDI r3, 130
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
