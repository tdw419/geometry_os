; DESCRIPTION: Draws a red line from (23, 20) to (166, 95).
; PLAN: r0=23(x1), r1=20(y1), r2=166(x2), r3=95(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 20
LDI r2, 166
LDI r3, 95
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
