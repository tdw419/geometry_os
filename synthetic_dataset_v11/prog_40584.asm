; DESCRIPTION: Draws a red line from (237, 1) to (96, 40).
; PLAN: r0=237(x1), r1=1(y1), r2=96(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 1
LDI r2, 96
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
