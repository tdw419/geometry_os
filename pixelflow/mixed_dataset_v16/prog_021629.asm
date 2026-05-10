; DESCRIPTION: Draws a magenta line from (509, 49) to (171, 119).
; PLAN: r0=509(x1), r1=49(y1), r2=171(x2), r3=119(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 49
LDI r2, 171
LDI r3, 119
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
