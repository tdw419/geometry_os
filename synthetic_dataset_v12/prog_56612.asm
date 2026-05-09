; DESCRIPTION: Draws a red line from (168, 165) to (118, 59).
; PLAN: r0=168(x1), r1=165(y1), r2=118(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 165
LDI r2, 118
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
