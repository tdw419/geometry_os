; DESCRIPTION: Draws a red line from (127, 180) to (381, 138).
; PLAN: r0=127(x1), r1=180(y1), r2=381(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 180
LDI r2, 381
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
