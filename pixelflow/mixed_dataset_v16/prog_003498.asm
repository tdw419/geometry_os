; DESCRIPTION: Draws a red line from (99, 30) to (285, 173).
; PLAN: r0=99(x1), r1=30(y1), r2=285(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 30
LDI r2, 285
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
