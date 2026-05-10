; DESCRIPTION: Renders a red line between points (214, 61) and (493, 94).
; PLAN: r0=214(x1), r1=61(y1), r2=493(x2), r3=94(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 61
LDI r2, 493
LDI r3, 94
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
