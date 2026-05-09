; DESCRIPTION: Draws a red line from (113, 11) to (216, 103).
; PLAN: r0=113(x1), r1=11(y1), r2=216(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 11
LDI r2, 216
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
