; DESCRIPTION: Draws a white line from (79, 127) to (114, 79).
; PLAN: r0=79(x1), r1=127(y1), r2=114(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 127
LDI r2, 114
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
