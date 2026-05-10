; DESCRIPTION: Draws a red line from (151, 210) to (458, 202).
; PLAN: r0=151(x1), r1=210(y1), r2=458(x2), r3=202(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 210
LDI r2, 458
LDI r3, 202
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
