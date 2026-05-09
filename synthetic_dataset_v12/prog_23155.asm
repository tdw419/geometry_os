; DESCRIPTION: Places a yellow line segment connecting (47, 206) to (391, 249).
; PLAN: r0=47(x1), r1=206(y1), r2=391(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 206
LDI r2, 391
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
