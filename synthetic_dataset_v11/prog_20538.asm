; DESCRIPTION: Draws a red line from (122, 137) to (240, 132).
; PLAN: r0=122(x1), r1=137(y1), r2=240(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 137
LDI r2, 240
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
