; DESCRIPTION: Draws a red line from (32, 10) to (21, 248).
; PLAN: r0=32(x1), r1=10(y1), r2=21(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 10
LDI r2, 21
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
