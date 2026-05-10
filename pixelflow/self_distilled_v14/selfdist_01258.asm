; DESCRIPTION: Draws a red line from (168, 93) to (158, 84).
; PLAN: r0=168(x1), r1=93(y1), r2=158(x2), r3=84(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 93
LDI r2, 158
LDI r3, 84
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
