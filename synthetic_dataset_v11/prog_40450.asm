; DESCRIPTION: Draws a red line from (176, 30) to (16, 23).
; PLAN: r0=176(x1), r1=30(y1), r2=16(x2), r3=23(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 30
LDI r2, 16
LDI r3, 23
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
