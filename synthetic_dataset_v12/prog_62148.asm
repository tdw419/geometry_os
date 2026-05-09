; DESCRIPTION: Draws a red line from (498, 17) to (207, 114).
; PLAN: r0=498(x1), r1=17(y1), r2=207(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 17
LDI r2, 207
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
