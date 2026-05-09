; DESCRIPTION: Draws a red line from (462, 237) to (10, 67).
; PLAN: r0=462(x1), r1=237(y1), r2=10(x2), r3=67(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 237
LDI r2, 10
LDI r3, 67
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
