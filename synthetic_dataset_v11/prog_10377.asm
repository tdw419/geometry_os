; DESCRIPTION: Draws a red line from (87, 27) to (145, 9).
; PLAN: r0=87(x1), r1=27(y1), r2=145(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 27
LDI r2, 145
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
