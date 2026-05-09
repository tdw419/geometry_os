; DESCRIPTION: Draws a red line from (361, 186) to (481, 76).
; PLAN: r0=361(x1), r1=186(y1), r2=481(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 186
LDI r2, 481
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
