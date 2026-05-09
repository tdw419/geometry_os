; DESCRIPTION: Draws a black line from (156, 56) to (174, 162).
; PLAN: r0=156(x1), r1=56(y1), r2=174(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 56
LDI r2, 174
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
