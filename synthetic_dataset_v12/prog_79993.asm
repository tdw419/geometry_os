; DESCRIPTION: Draws a red line from (184, 127) to (262, 20).
; PLAN: r0=184(x1), r1=127(y1), r2=262(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 127
LDI r2, 262
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
