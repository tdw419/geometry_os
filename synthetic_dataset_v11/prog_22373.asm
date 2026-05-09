; DESCRIPTION: Draws a white line from (126, 155) to (174, 47).
; PLAN: r0=126(x1), r1=155(y1), r2=174(x2), r3=47(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 155
LDI r2, 174
LDI r3, 47
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
