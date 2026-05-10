; DESCRIPTION: Draws a yellow line from (375, 191) to (306, 194).
; PLAN: r0=375(x1), r1=191(y1), r2=306(x2), r3=194(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 191
LDI r2, 306
LDI r3, 194
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
