; DESCRIPTION: Draws a red line from (75, 194) to (168, 222).
; PLAN: r0=75(x1), r1=194(y1), r2=168(x2), r3=222(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 194
LDI r2, 168
LDI r3, 222
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
