; DESCRIPTION: Draws a red line from (46, 76) to (21, 144).
; PLAN: r0=46(x1), r1=76(y1), r2=21(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 76
LDI r2, 21
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
