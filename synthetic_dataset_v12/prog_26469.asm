; DESCRIPTION: Draws a yellow line from (319, 45) to (303, 21).
; PLAN: r0=319(x1), r1=45(y1), r2=303(x2), r3=21(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 45
LDI r2, 303
LDI r3, 21
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
