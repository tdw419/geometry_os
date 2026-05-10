; DESCRIPTION: Draws a red line from (128, 109) to (172, 14).
; PLAN: r0=128(x1), r1=109(y1), r2=172(x2), r3=14(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 109
LDI r2, 172
LDI r3, 14
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
