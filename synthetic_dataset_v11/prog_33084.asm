; DESCRIPTION: Draws a red line from (93, 150) to (16, 152).
; PLAN: r0=93(x1), r1=150(y1), r2=16(x2), r3=152(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 150
LDI r2, 16
LDI r3, 152
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
