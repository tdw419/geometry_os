; DESCRIPTION: Draws a red line from (214, 80) to (187, 15).
; PLAN: r0=214(x1), r1=80(y1), r2=187(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 80
LDI r2, 187
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
