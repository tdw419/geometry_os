; DESCRIPTION: Draws a red line from (75, 254) to (28, 65).
; PLAN: r0=75(x1), r1=254(y1), r2=28(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 254
LDI r2, 28
LDI r3, 65
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
