; DESCRIPTION: Draws a magenta line from (52, 221) to (171, 153).
; PLAN: r0=52(x1), r1=221(y1), r2=171(x2), r3=153(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 221
LDI r2, 171
LDI r3, 153
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
