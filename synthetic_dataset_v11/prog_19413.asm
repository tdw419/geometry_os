; DESCRIPTION: Draws a red line from (211, 135) to (44, 57).
; PLAN: r0=211(x1), r1=135(y1), r2=44(x2), r3=57(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 135
LDI r2, 44
LDI r3, 57
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
