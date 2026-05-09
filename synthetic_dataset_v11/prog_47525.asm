; DESCRIPTION: Draws a red line from (142, 231) to (68, 134).
; PLAN: r0=142(x1), r1=231(y1), r2=68(x2), r3=134(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 231
LDI r2, 68
LDI r3, 134
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
