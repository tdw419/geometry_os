; DESCRIPTION: Draws a red line from (237, 13) to (90, 62).
; PLAN: r0=237(x1), r1=13(y1), r2=90(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 13
LDI r2, 90
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
