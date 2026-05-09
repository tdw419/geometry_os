; DESCRIPTION: Draws a black line from (174, 151) to (170, 127).
; PLAN: r0=174(x1), r1=151(y1), r2=170(x2), r3=127(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 151
LDI r2, 170
LDI r3, 127
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
