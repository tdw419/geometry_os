; DESCRIPTION: Draws a red line from (75, 193) to (23, 87).
; PLAN: r0=75(x1), r1=193(y1), r2=23(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 193
LDI r2, 23
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
