; DESCRIPTION: Draws a red line from (481, 93) to (292, 218).
; PLAN: r0=481(x1), r1=93(y1), r2=292(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 93
LDI r2, 292
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
