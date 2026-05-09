; DESCRIPTION: Draws a red line from (95, 176) to (481, 87).
; PLAN: r0=95(x1), r1=176(y1), r2=481(x2), r3=87(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 176
LDI r2, 481
LDI r3, 87
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
