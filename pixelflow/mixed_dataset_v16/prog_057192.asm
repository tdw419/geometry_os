; DESCRIPTION: Draws a red line from (492, 242) to (181, 200).
; PLAN: r0=492(x1), r1=242(y1), r2=181(x2), r3=200(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 242
LDI r2, 181
LDI r3, 200
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
