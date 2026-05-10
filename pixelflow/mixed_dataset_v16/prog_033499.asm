; DESCRIPTION: Draws a orange line from (368, 242) to (511, 212).
; PLAN: r0=368(x1), r1=242(y1), r2=511(x2), r3=212(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 242
LDI r2, 511
LDI r3, 212
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
