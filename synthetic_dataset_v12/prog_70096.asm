; DESCRIPTION: Draws a red line from (263, 127) to (191, 119).
; PLAN: r0=263(x1), r1=127(y1), r2=191(x2), r3=119(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 127
LDI r2, 191
LDI r3, 119
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
