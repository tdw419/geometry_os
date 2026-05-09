; DESCRIPTION: Draws a yellow line from (174, 45) to (303, 40).
; PLAN: r0=174(x1), r1=45(y1), r2=303(x2), r3=40(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 45
LDI r2, 303
LDI r3, 40
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
