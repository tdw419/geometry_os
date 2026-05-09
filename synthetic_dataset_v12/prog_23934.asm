; DESCRIPTION: Draws a red line from (4, 215) to (181, 9).
; PLAN: r0=4(x1), r1=215(y1), r2=181(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 215
LDI r2, 181
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
