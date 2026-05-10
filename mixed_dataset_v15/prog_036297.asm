; DESCRIPTION: Draws a red line from (491, 138) to (268, 168).
; PLAN: r0=491(x1), r1=138(y1), r2=268(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 138
LDI r2, 268
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
